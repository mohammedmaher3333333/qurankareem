import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

import '../../../../../core/utils/resources/assets_manager.dart';
import '../../../../../core/utils/resources/color_manager.dart';

class CustomTopContainer extends StatelessWidget {
  const CustomTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSize.s265,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
                'Al-Fatiah',
                style: getMediumStyle(
                    color: ColorManager.white, fontSize: FontSize.s26),
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              Text(
                'The Opening',
                style: getMediumStyle(
                    color: ColorManager.white, fontSize: FontSize.s16),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: AppMargin.m16, horizontal: AppMargin.m64),
                height: 2,
                color: ColorManager.whiteOpacity,
              ),
              RichText(
                text: TextSpan(
                  style: getMediumStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s14,
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
