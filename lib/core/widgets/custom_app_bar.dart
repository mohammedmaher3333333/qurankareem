import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

import '../utils/resources/color_manager.dart';
import '../utils/resources/font_manager.dart';
import '../utils/resources/styles_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onTapSuffix,
    this.onTapPrefix,
    required this.imagePathSuffix,
    required this.imagePathPrefix,
  });

  final String imagePathSuffix;
  final String imagePathPrefix;
  final String title;
  final void Function()? onTapSuffix;
  final void Function()? onTapPrefix;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTapPrefix,
          child: SvgPicture.asset(
            imagePathPrefix,
          ),
        ),
        const SizedBox(
          width: AppSize.s24,
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style: getBoldStyle(
            color: ColorManager.shadeOfPurple,
            fontSize: FontSize.s28,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTapSuffix,
          child: SvgPicture.asset(
            imagePathSuffix,
          ),
        ),

      ],
    );
  }
}
