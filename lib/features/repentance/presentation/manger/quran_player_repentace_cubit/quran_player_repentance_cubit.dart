import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quran_player_repentance_state.dart';

class QuranPlayerRepentanceCubit extends Cubit<QuranPlayerRepentanceState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  List<String> _tracks = [];
  int _currentTrackIndex = 0;

  QuranPlayerRepentanceCubit() : super(QuranPlayerRepentanceInitial()) {
    // الاستماع لانتهاء التشغيل للانتقال للمسار التالي
    _audioPlayer.onPlayerComplete.listen((event) {
      _playNextTrack();
    });
  }

  bool get isPlaying => _isPlaying;
  int get currentTrackIndex => _currentTrackIndex;

  // تحديث قائمة المسارات الصوتية
  void updateTracks(List<String> tracks) async {
    // إيقاف أي صوت قيد التشغيل
    await stopCurrentTrack();

    // تحديث قائمة المسارات الصوتية وإعادة ضبط الفهرس
    _tracks = tracks;
    _currentTrackIndex = 0;

    // تشغيل الصوت الأول في القائمة
    togglePlayPause();
  }

  // إيقاف الصوت الحالي إن كان يعمل
  Future<void> stopCurrentTrack() async {
    if (_isPlaying) {
      await _audioPlayer.stop();
      _isPlaying = false;
      emit(QuranPlayerRepentanceStopped());
    }
  }

  // تشغيل أو إيقاف الصوت
  void togglePlayPause() async {
    if (_isPlaying) {
      await stopCurrentTrack(); // إيقاف الصوت الحالي
    } else {
      await _playCurrentTrack(); // تشغيل الصوت إن لم يكن يعمل
    }
  }

  // تشغيل الآية الحالية
  Future<void> _playCurrentTrack() async {
    if (_tracks.isNotEmpty) {
      // التأكد من إيقاف أي تشغيل سابق
      await stopCurrentTrack();

      // تشغيل الآية الحالية وتحديث الحالة
      await _audioPlayer.play(UrlSource(_tracks[_currentTrackIndex]));
      _isPlaying = true;
      emit(QuranPlayerRepentancePlaying());
    }
  }

  // الانتقال إلى الآية التالية
  void _playNextTrack() async {
    if (_currentTrackIndex < _tracks.length - 1) {
      _currentTrackIndex++;
      await _playCurrentTrack();
      emit(QuranPlayerRepentanceTrackUpdated(_tracks[_currentTrackIndex]));
    } else {
      _isPlaying = false;
      emit(QuranPlayerRepentanceStopped());
    }
  }
}
