import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qurankareem/core/utils/resources/assets_manager.dart';
import 'package:qurankareem/core/utils/resources/color_manager.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

class CustomContainerImage extends StatelessWidget {
  const CustomContainerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSize.s131,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s10),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ColorManager.lightPurple,
                ColorManager.mediumPurple,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      ImageAssets.smallBook,
                    ),
                    const SizedBox(
                      width: AppSize.s8,
                    ),
                    Text(
                      AppStrings.lastRead,
                      style: getMediumStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text('suraName',
                  style: getSemiBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s18,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s4,
                ),
                Text(
                  AppStrings.ayahNum,
                  style: getRegularStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s14,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: -30,
          bottom: -26,
          child: SvgPicture.asset(
            ImageAssets.logo,
            width: 206,
            height: 114,
          ),
        ),

      ],
    );
  }
}
