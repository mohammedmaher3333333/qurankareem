import 'package:flutter/material.dart';
import 'package:qurankareem/core/widgets/custom_app_bar.dart';
import 'package:qurankareem/features/bookmarks/presentation/views/widgets/bookmarks_build_add_collection.dart';
import 'package:qurankareem/features/bookmarks/presentation/views/widgets/bookmarks_build_new_collection.dart';

import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          title: AppStrings.bookmarks,
          imagePathSuffix: ImageAssets.searchLine,
          imagePathPrefix: ImageAssets.menu2line,
        ),
        SizedBox(height: AppSize.s24),
        BookmarksBuildAddCollection(),
        SizedBox(height: AppSize.s32),
        BookmarksBuildNewCollection(),
        BookmarksBuildNewCollection(),
      ],
    );
  }
}
