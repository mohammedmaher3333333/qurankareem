import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qurankareem/features/home/presentation/views/widgets/surah_list_item.dart';

import '../../../../../core/utils/resources/routes_manager.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSurahDetailsView,);
          },
          child: SurahListItem(
            index: index,
          ),
        ),
      ),
    );
  }
}
