import 'package:flutter/material.dart';
import 'package:qurankareem/features/home/presentation/views/widgets/custom_classification_list.dart';
import 'package:qurankareem/features/home/presentation/views/widgets/custom_container_image.dart';
import 'package:qurankareem/features/home/presentation/views/widgets/custom_top_two_text.dart';
import 'package:qurankareem/features/home/presentation/views/widgets/surah_list_view.dart';

import '../../../../../core/utils/resources/assets_manager.dart';
import '../../../../../core/utils/resources/strings_manager.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          title: AppStrings.quranApp,
          imagePathSuffix: ImageAssets.searchLine,
          imagePathPrefix: ImageAssets.menu2line,
        ),
        CustomTopTwoText(),
        CustomContainerImage(),
        CustomClassificationList(),
        SurahListView(),
      ],
    );
  }
}
