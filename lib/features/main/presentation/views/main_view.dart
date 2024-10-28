import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurankareem/features/Reminder/presentation/views/reminder_view.dart';
import 'package:qurankareem/features/bookmarks/presentation/views/bookmarks_view.dart';
import 'package:qurankareem/features/home/presentation/manger/classification_list_cubit/classification_list_cubit.dart';
import 'package:qurankareem/features/main/presentation/views/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:qurankareem/features/repentance/presentation/views/repentance_view.dart';
import 'package:qurankareem/features/supplication/presentation/views/supplication_view.dart';

import '../../../../core/utils/resources/values_manager.dart';
import '../../../bookmarks/presentation/manger/build_bookmarks_collection_cubit/build_bookmarks_collection_cubit.dart';
import '../../../home/presentation/views/home_view.dart';
import '../manger/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s24,
          ),
          child: BlocBuilder<BottomNavigationBarCubit, int>(
            builder: (context, currentIndex) {
              return IndexedStack(
                index: currentIndex,
                children: [
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => ClassificationListCubit(),
                      ),
                    ],
                    child: const HomeView(),
                  ),
                  const ReminderView(),
                  const RepentanceView(),
                  const SupplicationView(),
                  BlocProvider(
                    create: (_) => BuildBookmarksCollectionCubit(),
                    child: const BookmarksView(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
