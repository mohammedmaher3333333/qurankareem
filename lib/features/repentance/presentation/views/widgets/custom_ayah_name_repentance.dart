import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qurankareem/features/home/data/models/quran_model/quran_model.dart';

import '../../../../../core/utils/resources/assets_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../manger/quran_player_repentace_cubit/quran_player_repentance_cubit.dart';

class CustomAyahNameRepentance extends StatelessWidget {
  const CustomAyahNameRepentance({super.key, required this.surah});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppPadding.p24,
      ),
      child: Row(
        children: [
          BlocBuilder<QuranPlayerRepentanceCubit, QuranPlayerRepentanceState>(
            builder: (context, state) {
              final isPlaying = context.read<QuranPlayerRepentanceCubit>().isPlaying;

              return GestureDetector(
                onTap: () {
                  // تمرير روابط الصوت لكل آية في السورة إلى cubit
                  List<String> ayahTracks = surah.ayahs.map((ayah) => ayah.audio ?? '').toList();
                  context.read<QuranPlayerRepentanceCubit>().updateTracks(ayahTracks);
                  context.read<QuranPlayerRepentanceCubit>().togglePlayPause();
                },
                child: SvgPicture.asset(
                  isPlaying ? ImageAssets.stopMusic : ImageAssets.path,
                  width: 30,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

