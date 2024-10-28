import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/quran_model/quran_model.dart';

part 'build_bookmarks_collection_state.dart';

class BuildBookmarksCollectionCubit extends Cubit<BuildBookmarksCollectionState> {
  BuildBookmarksCollectionCubit() : super(BuildBookmarksCollectionInitial()) {
    // إضافة مجموعة افتراضية عند إنشاء الكيوبت
    addCollection("Default Collection");
  }

  final List<Map<String, dynamic>> _collections = [];

  void addCollection(String collectionName) {
    _collections.add({
      "name": collectionName,
      "items": <Ayah>[], // تأكد من أن الحقل "items" يحتوي على قائمة من نوع Ayah
    });
    emit(BuildBookmarksCollectionLoaded(List.from(_collections)));
  }

  void addItemToCollection(int index, Ayah ayah) {
    if (_collections.isNotEmpty && index >= 0 && index < _collections.length) {
      (_collections[index]["items"] as List<Ayah>).add(ayah);
      print(_collections.length);
      print(_collections[index]['items']);
      emit(BuildBookmarksCollectionLoaded(List.from(_collections)));
    }
  }

  void removeCollection(int index) {
    if (index >= 0 && index < _collections.length) {
      _collections.removeAt(index);
      emit(BuildBookmarksCollectionLoaded(List.from(_collections)));
    }
  }

  List<Map<String, dynamic>> get collections => _collections;
}



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// part 'build_bookmarks_collection_state.dart';
//
// class BuildBookmarksCollectionCubit extends Cubit<BuildBookmarksCollectionState> {
//   BuildBookmarksCollectionCubit() : super(BuildBookmarksCollectionInitial());
//
//   final List<String> _collections = [];
//
//   void addCollection(String collectionName) {
//     _collections.add(collectionName);
//     print('collections  $_collections');
//     emit(BuildBookmarksCollectionLoaded(List.from(_collections)));
//   }
//
//   void removeCollection(int index) {
//     if (index >= 0 && index < _collections.length) {
//       _collections.removeAt(index);
//       emit(BuildBookmarksCollectionLoaded(List.from(_collections)));
//     }
//   }
// }
