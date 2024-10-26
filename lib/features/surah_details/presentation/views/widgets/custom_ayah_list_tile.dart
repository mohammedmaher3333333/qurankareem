import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurankareem/features/surah_details/presentation/manger/quran_player_cubit/quran_player_cubit.dart';
import 'package:qurankareem/features/surah_details/presentation/views/widgets/custom_ayah_actions.dart';
import 'package:qurankareem/features/surah_details/presentation/views/widgets/custom_ayah_name.dart';

import '../../../../home/data/models/quran_model/quran_model.dart';

class CustomAyahListTile extends StatelessWidget {
  const CustomAyahListTile({
    super.key,
    required this.ayah,
  });

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (context) => QuranPlayerCubit(),
          child: CustomAyahActions(ayah: ayah),
        ),
        CustomAyahName(ayah: ayah),
      ],
    );
  }
}
