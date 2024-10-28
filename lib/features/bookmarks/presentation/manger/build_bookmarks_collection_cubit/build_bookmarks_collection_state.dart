part of 'build_bookmarks_collection_cubit.dart';

@immutable
abstract class BuildBookmarksCollectionState {}

class BuildBookmarksCollectionInitial extends BuildBookmarksCollectionState {}

class BuildBookmarksCollectionLoaded extends BuildBookmarksCollectionState {
  final List<Map<String, dynamic>> collections;

  BuildBookmarksCollectionLoaded(this.collections);
}
