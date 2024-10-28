import 'package:flutter/material.dart';
import 'package:qurankareem/features/home/data/models/quran_model/quran_model.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/font_manager.dart';
import '../../../../../core/utils/resources/styles_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';

class CustomAyahNameSupplication extends StatelessWidget {
  const CustomAyahNameSupplication({super.key, required this.ayah});

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppPadding.p24,
      ),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: ayah.text,
                    style: getBoldStyle(
                      color: ColorManager.darkPurple,
                      fontSize: FontSize.s18,
                      font: FontConstants.fontAmiri,
                      height: 2.5,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: AppSize.s24,
                        width: AppSize.s24,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
