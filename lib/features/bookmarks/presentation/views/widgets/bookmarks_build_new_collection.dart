import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qurankareem/core/utils/resources/assets_manager.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/font_manager.dart';
import '../../../../../core/utils/resources/styles_manager.dart';

class BookmarksBuildNewCollection extends StatelessWidget {
  const BookmarksBuildNewCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p32),
      child: SizedBox(
        height: 46,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              ImageAssets.folder,
            ),
            const SizedBox(
              width: AppSize.s16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                Text(
                  AppStrings.addNewCollection,
                  style: getMediumStyle(
                    color: ColorManager.darkPurple,
                    fontSize: FontSize.s16,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s4,
                ),
                Text(
                  '8 items',
                  style: getMediumStyle(
                    color: ColorManager.bluishGray,
                    fontSize: FontSize.s12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              ImageAssets.moreVertical,
            ),
          ],
        ),
      ),
    );
  }
}
