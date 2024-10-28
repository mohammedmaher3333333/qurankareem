import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/quran_model/quran_model.dart';
import '../../manger/build_bookmarks_collection_cubit/build_bookmarks_collection_cubit.dart';

class CustomCollectionDataListView extends StatelessWidget {
  const CustomCollectionDataListView(
      {super.key, required this.collectionIndex});

  final int collectionIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildBookmarksCollectionCubit,
        BuildBookmarksCollectionState>(
      builder: (context, state) {
        if (state is BuildBookmarksCollectionLoaded) {
          List<Ayah> items =
              state.collections[collectionIndex]['items'] as List<Ayah>;

          if (items.isEmpty) {
            return const Center(child: Text('No Items'));
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final ayah = items[index];
              return ListTile(
                title: Text(ayah.text),
                subtitle: Text('Ayah number: ${ayah.numberInSurah}'),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
