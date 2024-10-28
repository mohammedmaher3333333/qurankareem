part of 'quran_player_repentance_cubit.dart';

abstract class QuranPlayerRepentanceState {}

class QuranPlayerRepentanceInitial extends QuranPlayerRepentanceState {}

class QuranPlayerRepentancePlaying extends QuranPlayerRepentanceState {}

class QuranPlayerRepentancePaused extends QuranPlayerRepentanceState {}

class QuranPlayerRepentanceStopped extends QuranPlayerRepentanceState {}

class QuranPlayerRepentanceTrackUpdated extends QuranPlayerRepentanceState {
  final String newTrackUrl;

  QuranPlayerRepentanceTrackUpdated(this.newTrackUrl);
}
