import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qurankareem/core/utils/resources/assets_manager.dart';
import 'package:qurankareem/core/utils/resources/color_manager.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

import '../../manger/build_bookmarks_collection_cubit/build_bookmarks_collection_cubit.dart';

class BookmarksBuildAddCollection extends StatelessWidget {
  const BookmarksBuildAddCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            final collectionName = await _showCollectionNameDialog(context);
            if (collectionName != null && collectionName.isNotEmpty) {
              final cubit = context.read<BuildBookmarksCollectionCubit>();
              cubit.addCollection(collectionName);
            }
          },
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

  Future<String?> _showCollectionNameDialog(BuildContext context) async {
    String? collectionName;
    await showDialog<String>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Enter Collection Name'),
          content: TextField(
            onChanged: (value) {
              collectionName = value;
            },
            decoration: const InputDecoration(hintText: "Collection Name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(dialogContext).pop(collectionName);
              },
            ),
          ],
        );
      },
    );
    return collectionName;
  }
}
