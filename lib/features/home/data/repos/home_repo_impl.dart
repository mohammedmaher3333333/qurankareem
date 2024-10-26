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
      var arabicResponse = await apiService.get(endPoint: 'quran/ar.alafasy');
      var englishResponse = await apiService.get(endPoint: 'quran/en.sahih');

      QuranModel arabicQuranData = QuranModel.fromJson(arabicResponse);
      QuranModel englishQuranData = QuranModel.fromJson(englishResponse);

      final surahs = arabicQuranData.surahs;
      if (surahs.isNotEmpty) {
        for (int i = 0; i < surahs.length; i++) {
          final arabicSurah = surahs[i];
          final englishSurah = englishQuranData.surahs[i];

          for (int j = 0; j < arabicSurah.ayahs.length; j++) {
            arabicSurah.ayahs[j].numberInSurah = j + 1;

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
