import 'package:dartz/dartz.dart';
import 'package:qurankareem/features/home/data/models/quran_model/quran_model.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Surah>>> fetchQuran();
  Future<Either<Failure, List<Surah>>> filterQuranByClassification(String classification);

}

