import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qurankareem/core/utils/resources/assets_manager.dart';
import 'package:qurankareem/core/utils/resources/color_manager.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

class CustomAyahActions extends StatelessWidget {
  const CustomAyahActions({super.key});

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
                '1',
                style: getMediumStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
          ),
          const Spacer(),
          SvgPicture.asset(ImageAssets.share),
          const SizedBox(width: AppSize.s16),
          SvgPicture.asset(ImageAssets.path),
          const SizedBox(width: AppSize.s16),
          SvgPicture.asset(ImageAssets.favorite),
        ],
      ),
    );
  }
}
