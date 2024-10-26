import 'package:flutter/material.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';
import 'package:qurankareem/features/home/data/models/quran_model/quran_model.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/font_manager.dart';
import '../../../../../core/utils/resources/styles_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';

class CustomAyahName extends StatelessWidget {
  const CustomAyahName({super.key, required this.ayah});

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  ayah.text,
                  textDirection: TextDirection.rtl,
                  style: getBoldStyle(
                    color: ColorManager.darkPurple,
                    fontSize: FontSize.s18,
                    font: FontConstants.fontAmiri,
                    height: 2.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSize.s16),
          Text(
            ayah.englishTranslation ?? AppStrings.noContent,
            style: getRegularStyle(
              color: ColorManager.darkPurple,
              fontSize: FontSize.s14,
            ),
          ),
          const SizedBox(height: AppSize.s16),
          Container(
            height: AppSize.s2,
            color: ColorManager.lightGrayishBlue,
          ),
        ],
      ),
    );
  }
}
