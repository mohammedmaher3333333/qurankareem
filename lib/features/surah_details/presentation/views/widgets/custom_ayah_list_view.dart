import 'package:flutter/material.dart';
import 'package:qurankareem/features/surah_details/presentation/views/widgets/custom_ayah_list_tile.dart';

class CustomAyahListView extends StatelessWidget {
  const CustomAyahListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const CustomAyahListTile(),
      ),
    );
  }
}
