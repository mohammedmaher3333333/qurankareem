import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qurankareem/core/utils/resources/assets_manager.dart';
import 'package:qurankareem/core/utils/resources/color_manager.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';

import '../../../../../core/utils/resources/values_manager.dart';

class SurahListItem extends StatelessWidget {
  const SurahListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(ImageAssets.aya),
          Text(
            '${index + 1}',
            style: getMediumStyle(
              color: ColorManager.darkPurple,
              fontSize: FontSize.s14,
            ),
          ),
        ],
      ),
      title: Text(
        AppStrings.suraName,
        style: getMediumStyle(
          color: ColorManager.darkPurple,
          fontSize: FontSize.s16,
        ),
      ),
      subtitle: RichText(
        text: TextSpan(
          style: getMediumStyle(
            color: ColorManager.bluishGray,
            fontSize: FontSize.s12,
          ),
          children: [
            const TextSpan(
              text: 'Meccan',
            ),
            WidgetSpan(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: AppMargin.m5,
                  horizontal: AppMargin.m5,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.lightGrayishBlue,
                ),
                width: 4,
                height: 4,
              ),
            ),
            const TextSpan(text: '7 verses'),
          ],
        ),
      ),
      trailing: Text(
        'الفاتحه',
        style: getBoldStyle(
          color: ColorManager.brightPurple,
          font: FontConstants.fontAmiri,
          fontSize: FontSize.s20,
        ),
      ),
    );
  }
}
