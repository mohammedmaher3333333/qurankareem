import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qurankareem/features/home/data/repos/home_repo.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../models/quran_model/quran_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Surah>>> fetchQuran() async {
    try {
      // استدعاء النص العربي والصوت
      var arabicResponse = await apiService.get(endPoint: 'quran/ar.alafasy');
      // print('arabicResponse $arabicResponse');
      // استدعاء الترجمة الإنجليزية
      var englishResponse = await apiService.get(endPoint: 'quran/en.sahih');
      // print('englishResponse $englishResponse');

      // تحويل الاستجابات إلى نماذج
      QuranModel arabicQuranData = QuranModel.fromJson(arabicResponse);
      QuranModel englishQuranData = QuranModel.fromJson(englishResponse);

      final surahs = arabicQuranData.surahs;
      if (surahs.isNotEmpty) {
        // دمج النصوص مع الترجمة وإعادة تعيين أرقام الآيات
        for (int i = 0; i < surahs.length; i++) {
          final arabicSurah = surahs[i];
          final englishSurah = englishQuranData.surahs[i];

          for (int j = 0; j < arabicSurah.ayahs.length; j++) {
            // إعادة تعيين أرقام الآيات لكل سورة بحيث تبدأ من 1
            arabicSurah.ayahs[j].numberInSurah = j + 1;

            // إضافة الترجمة الإنجليزية لكل آية
            final englishText = englishSurah.ayahs[j].text;
            arabicSurah.ayahs[j].englishTranslation = englishText;
          }
        }
      }

      if (surahs.isNotEmpty) {
        return Right(surahs);
      } else {
        return const Right([]);
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
