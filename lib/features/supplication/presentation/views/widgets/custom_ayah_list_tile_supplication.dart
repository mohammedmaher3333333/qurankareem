import 'package:flutter/material.dart';
import 'package:qurankareem/features/supplication/presentation/views/widgets/custom_ayah_name_supplication.dart';

import '../../../../home/data/models/quran_model/quran_model.dart';

class CustomAyahListTileSupplication extends StatelessWidget {
  const CustomAyahListTileSupplication({
    super.key,
    required this.ayah,
  });

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAyahNameSupplication(ayah: ayah),
      ],
    );
  }
}
