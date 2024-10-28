import 'package:flutter/material.dart';
import 'package:qurankareem/features/bookmarks/presentation/views/widgets/custom_collection_data_list.dart';

class CollectionView extends StatelessWidget {
  const CollectionView({super.key, required this.collectionIndex});

  final int collectionIndex;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomCollectionDataListView(collectionIndex: 0),
      ),
    );
  }
}
