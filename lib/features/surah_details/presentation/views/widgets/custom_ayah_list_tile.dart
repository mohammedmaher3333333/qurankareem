import 'package:flutter/material.dart';
import 'package:qurankareem/core/utils/resources/color_manager.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/features/surah_details/presentation/views/widgets/custom_ayah_actions.dart';

import '../../../../../core/utils/resources/values_manager.dart';

class CustomAyahListTile extends StatelessWidget {
  const CustomAyahListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAyahActions(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'الحمد لله رب العالمين',
                    style: getBoldStyle(
                      color: ColorManager.darkPurple,
                      fontSize: FontSize.s18,
                      font: FontConstants.fontAmiri,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s16),
              Text(
                'The Entirely Merciful, the Especially Merciful,',
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
        ),
      ],
    );
  }
}
