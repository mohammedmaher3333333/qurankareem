import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qurankareem/core/utils/resources/assets_manager.dart';
import 'package:qurankareem/core/utils/resources/color_manager.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/features/home/data/models/quran_model/quran_model.dart';

import '../../../../../core/utils/resources/values_manager.dart';

class SurahListItem extends StatelessWidget {
  const SurahListItem({super.key, required this.surah});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(ImageAssets.aya),
          Text(
            '${surah.number}',
            style: getMediumStyle(
              color: ColorManager.darkPurple,
              fontSize: FontSize.s14,
            ),
          ),
        ],
      ),
      title: Text(
        surah.englishName,
        style: getMediumStyle(
          color: ColorManager.darkPurple,
          fontSize: FontSize.s14,
        ),
      ),
      subtitle: RichText(
        text: TextSpan(
          style: getMediumStyle(
            color: ColorManager.bluishGray,
            fontSize: FontSize.s10,
          ),
          children: [
            TextSpan(
              text: surah.revelationType,
            ),
            WidgetSpan(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: AppMargin.m5,
                  horizontal: AppMargin.m2,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.lightGrayishBlue,
                ),
                width: AppSize.s3,
                height: AppSize.s3,
              ),
            ),
            TextSpan(text: '${surah.ayahs.length} ${AppStrings.verses}'),
          ],
        ),
      ),
      trailing: Text(
        surah.name,
        style: getBoldStyle(
          color: ColorManager.brightPurple,
          font: FontConstants.fontAmiri,
          fontSize: FontSize.s18,
        ),
      ),
    );
  }
}
