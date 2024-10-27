import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurankareem/features/home/data/models/quran_model/quran_model.dart';

import '../../../data/repos/home_repo.dart';

part 'fetch_quran_state.dart';

class FetchQuranCubit extends Cubit<FetchQuranState> {
  FetchQuranCubit(this.homeRepo) : super(FetchQuranInitial());
  final HomeRepo homeRepo;

  Future<void> fetchQuran() async {
    emit(FetchQuranLoading());
    var result = await homeRepo.fetchQuran();
    result.fold(
      (failure) => emit(FetchQuranFailure(failure.errMessage)),
      (quran) => emit(FetchQuranSuccess(quran)),
    );
  }

  Future<void> fetchQuranByClassification(String classification) async {
    emit(FetchQuranLoading());
    var result = await homeRepo.filterQuranByClassification(classification);
    result.fold(
      (failure) => emit(FetchQuranFailure(failure.errMessage)),
      (quran) => emit(FetchQuranSuccess(quran)),
    );
  }
}
