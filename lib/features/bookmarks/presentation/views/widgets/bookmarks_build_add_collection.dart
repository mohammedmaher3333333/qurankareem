import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qurankareem/core/utils/resources/assets_manager.dart';
import 'package:qurankareem/core/utils/resources/color_manager.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

class BookmarksBuildAddCollection extends StatelessWidget {
  const BookmarksBuildAddCollection({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              SvgPicture.asset(
                ImageAssets.folderPlus,
              ),
              const SizedBox(
                width: AppSize.s8,
              ),
              Text(
                AppStrings.addNewCollection,
                style: getMediumStyle(
                  color: ColorManager.brightPurple,
                  fontSize: FontSize.s16,
                ),
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          ImageAssets.menu3line,
        ),
      ],
    );
  }
}
