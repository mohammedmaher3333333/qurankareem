import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';

class ClassificationListCubit extends Cubit<String> {
  ClassificationListCubit() : super(AppStrings.surah);

  void selectItem(String selectedItem) {
    emit(selectedItem);
  }
}
