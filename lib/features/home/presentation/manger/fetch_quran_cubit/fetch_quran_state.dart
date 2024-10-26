part of 'fetch_quran_cubit.dart';

@immutable
sealed class FetchQuranState {}

final class FetchQuranInitial extends FetchQuranState {}

final class FetchQuranLoading extends FetchQuranState {}

final class FetchQuranFailure extends FetchQuranState {
  final String errMessage;

  FetchQuranFailure(this.errMessage);
}

class FetchQuranSuccess extends FetchQuranState {
  final List<Surah> surah;

  FetchQuranSuccess(this.surah);
}
