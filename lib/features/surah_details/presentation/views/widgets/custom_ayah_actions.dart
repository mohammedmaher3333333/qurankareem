import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qurankareem/core/utils/resources/assets_manager.dart';
import 'package:qurankareem/core/utils/resources/color_manager.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';
import 'package:qurankareem/features/surah_details/presentation/manger/quran_player_cubit/quran_player_cubit.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../bookmarks/presentation/manger/build_bookmarks_collection_cubit/build_bookmarks_collection_cubit.dart';
import '../../../../home/data/models/quran_model/quran_model.dart';

class CustomAyahActions extends StatelessWidget {
  const CustomAyahActions({super.key, required this.ayah});

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p10,
        horizontal: AppPadding.p13,
      ),
      height: AppSize.s47,
      decoration: BoxDecoration(
        color: ColorManager.darkBlueGray,
        borderRadius: BorderRadius.circular(
          AppSize.s10,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: AppSize.s27,
            width: AppSize.s27,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.brightPurple,
            ),
            child: Center(
              child: Text(
                '${ayah.numberInSurah}',
                style: getMediumStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Share.share('${ayah.text} {${ayah.numberInSurah}}');
              print('object');
            },
            child: SvgPicture.asset(
              ImageAssets.share,
            ),
          ),
          const SizedBox(width: AppSize.s16),
          BlocBuilder<QuranPlayerCubit, QuranPlayerState>(
            builder: (context, state) {
              final isPlaying = context.read<QuranPlayerCubit>().isPlaying;

              return GestureDetector(
                onTap: () {
                  context.read<QuranPlayerCubit>().updateTrack('${ayah.audio}');
                  context.read<QuranPlayerCubit>().togglePlayPause();
                },
                child: SvgPicture.asset(
                  isPlaying ? ImageAssets.stopMusic : ImageAssets.path,
                  width: 30,
                ),
              );
            },
          ),
          const SizedBox(width: AppSize.s16),
          GestureDetector(
            onTap: () {
              final cubit = context.read<BuildBookmarksCollectionCubit>();

              if (cubit.collections.isNotEmpty) {
                cubit.addItemToCollection(0, ayah);
                print('Added: ${ayah.text}');
                print(
                    'Collection Items: ${cubit.collections[0]['items']?.map((a) => a.text).toList()}');
              } else {
                print("No collections found to add the Ayah.");
              }
            },
            child: SvgPicture.asset(
              ImageAssets.favorite,
            ),
          ),
        ],
      ),
    );
  }
}
