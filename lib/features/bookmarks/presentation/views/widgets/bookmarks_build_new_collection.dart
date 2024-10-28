import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qurankareem/core/utils/resources/assets_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/font_manager.dart';
import '../../../../../core/utils/resources/styles_manager.dart';
import '../../manger/build_bookmarks_collection_cubit/build_bookmarks_collection_cubit.dart';

class BookmarksBuildNewCollection extends StatelessWidget {
  const BookmarksBuildNewCollection(
      {super.key, required this.name, required this.index});

  final String name;
  final int index;

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
                  // AppStrings.addNewCollection,
                  name,
                  style: getMediumStyle(
                    color: ColorManager.darkPurple,
                    fontSize: FontSize.s16,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s4,
                ),
                Text(
                  '2 items',
                  style: getMediumStyle(
                    color: ColorManager.bluishGray,
                    fontSize: FontSize.s12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                _showDelete(context, index: index);
              },
              child: SvgPicture.asset(
                ImageAssets.moreVertical,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showDelete(BuildContext context,
      {required int index}) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('delete'),
          actions: <Widget>[
            TextButton(
              child: const Text('delete'),
              onPressed: () {
                context
                    .read<BuildBookmarksCollectionCubit>()
                    .removeCollection(index);
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
    return null;
  }
}
