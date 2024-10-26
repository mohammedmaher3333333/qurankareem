import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qurankareem/features/surah_details/presentation/views/widgets/custom_ayah_list_view.dart';
import 'package:qurankareem/features/surah_details/presentation/views/widgets/custom_top_container.dart';

import '../../../../../core/utils/resources/assets_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../home/data/models/quran_model/quran_model.dart';

class SurahDetailsViewBody extends StatelessWidget {
  const SurahDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Surah surah = GoRouterState.of(context).extra as Surah;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s24,
      ),
      child: Column(
        children: [
          CustomAppBar(
            title: surah.name,
            imagePathSuffix: ImageAssets.searchLine,
            imagePathPrefix: ImageAssets.arrowBack,
            onTapPrefix: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: AppSize.s24),
          CustomTopContainer(surah: surah),
          const SizedBox(height: AppSize.s32),
          CustomAyahListView(surah: surah),
        ],
      ),
    );
  }
}
