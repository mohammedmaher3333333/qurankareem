import 'package:flutter/material.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/font_manager.dart';
import '../../../../../core/utils/resources/strings_manager.dart';
import '../../../../../core/utils/resources/styles_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';

class CustomTopTwoText extends StatelessWidget {
  const CustomTopTwoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.asslamualaikum,
            style: getMediumStyle(
              color: ColorManager.desaturatedLavender,
              fontSize: FontSize.s18,
            ),
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          Text(
            AppStrings.tanvirAhassan,
            style: getSemiBoldStyle(
              color: ColorManager.darkPurple,
              fontSize: FontSize.s24,
            ),
          ),
        ],
      ),
    );
  }
}
