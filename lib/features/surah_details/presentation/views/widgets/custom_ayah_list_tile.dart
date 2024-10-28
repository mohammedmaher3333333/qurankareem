import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurankareem/features/surah_details/presentation/manger/quran_player_cubit/quran_player_cubit.dart';
import 'package:qurankareem/features/surah_details/presentation/views/widgets/custom_ayah_actions.dart';
import 'package:qurankareem/features/surah_details/presentation/views/widgets/custom_ayah_name.dart';

import '../../../../bookmarks/presentation/manger/build_bookmarks_collection_cubit/build_bookmarks_collection_cubit.dart';
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
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => QuranPlayerCubit(),
            ),
            BlocProvider(
              create: (context) => BuildBookmarksCollectionCubit(),
            ),
          ],
          child: CustomAyahActions(ayah: ayah),
        ),
        CustomAyahName(ayah: ayah),
      ],
    );
  }
}
