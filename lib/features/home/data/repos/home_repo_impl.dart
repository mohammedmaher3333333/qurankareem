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
      var response = await apiService.get(endPoint: 'quran/ar.alafasy');
      QuranModel quranData = QuranModel.fromJson(response);
      final surahs = quranData.surahs;
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
