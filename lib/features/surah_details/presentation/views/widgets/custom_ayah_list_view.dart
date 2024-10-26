import 'package:flutter/material.dart';
import 'package:qurankareem/features/surah_details/presentation/views/widgets/custom_ayah_list_tile.dart';

import '../../../../home/data/models/quran_model/quran_model.dart';

class CustomAyahListView extends StatelessWidget {
  const CustomAyahListView({super.key, required this.surah});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: surah.ayahs.length,
          itemBuilder: (context, index) {
            final ayah = surah.ayahs[index];
            return CustomAyahListTile(
              ayah: ayah,
            );
          }),
    );
  }
}
