import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';
import 'package:qurankareem/features/home/data/models/quran_model/quran_model.dart';

import '../../../../../core/utils/resources/assets_manager.dart';
import '../../../../../core/utils/resources/color_manager.dart';

class CustomTopContainer extends StatelessWidget {
  const CustomTopContainer({super.key, required this.surah});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSize.s265,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s20),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ColorManager.lightPurple,
                ColorManager.mediumPurple,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                surah.name,
                style: getMediumStyle(
                    color: ColorManager.white, fontSize: FontSize.s26),
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              Text(
                AppStrings.theOpening,
                style: getMediumStyle(
                    color: ColorManager.white, fontSize: FontSize.s16),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: AppMargin.m16, horizontal: AppMargin.m64),
                height: AppSize.s2,
                color: ColorManager.whiteOpacity,
              ),
              RichText(
                text: TextSpan(
                  style: getMediumStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s14,
                  ),
                  children: [
                    TextSpan(
                      text: surah.revelationType,
                    ),
                    WidgetSpan(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: AppMargin.m8,
                          horizontal: AppMargin.m5,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.lightGrayishBlue,
                        ),
                        width: AppSize.s4,
                        height: AppSize.s4,
                      ),
                    ),
                    TextSpan(
                        text: '${surah.ayahs.length} ${AppStrings.verses}'),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s32,
              ),
              SvgPicture.asset(
                ImageAssets.bemAllah,
              ),
            ],
          ),
        ),
        Positioned(
          right: AppSize.s_60,
          bottom: AppSize.s_40,
          child: Opacity(
            opacity: 0.06,
            child: SvgPicture.asset(
              ImageAssets.logo,
              width: AppSize.s325,
              height: AppSize.s200,
            ),
          ),
        ),
      ],
    );
  }
}
