import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qurankareem/features/Reminder/presentation/views/reminder_view.dart';
import 'package:qurankareem/features/main/presentation/views/main_view.dart';
import 'package:qurankareem/features/repentance/presentation/views/repentance_view.dart';
import 'package:qurankareem/features/supplication/presentation/views/supplication_view.dart';
import 'package:qurankareem/features/surah_details/presentation/views/surah_details_view.dart';

import '../../../features/bookmarks/presentation/manger/build_bookmarks_collection_cubit/build_bookmarks_collection_cubit.dart';
import '../../../features/bookmarks/presentation/views/bookmarks_view.dart';
import '../../../features/bookmarks/presentation/views/collection_view.dart';
import '../../../features/home/presentation/views/home_view.dart';
import '../../../features/main/presentation/manger/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import '../../../features/splash/presentation/views/splash_view.dart';
import '../../../features/supplication/presentation/views/surah_details_view_supplication.dart';

abstract class AppRouter {
  static const kMainView = '/mainView';
  static const kHomeView = '/homeView';
  static const kBookmarksView = '/bookmarksView';
  static const kSurahDetailsView = '/surahDetails';
  static const kSurahDetailsViewSupplication = '/surahDetailsSupplication';
  static const kReminderView = '/reminderView';
  static const kRepentanceView = '/repentanceView';
  static const kSupplicationView = '/supplicationView';
  static const kCollectionView = '/collectionView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kMainView,
        builder: (context, state) => BlocProvider(
          create: (context) => BottomNavigationBarCubit(),
          child: const MainView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookmarksView,
        builder: (context, state) => const BookmarksView(),
      ),
      GoRoute(
        path: kReminderView,
        builder: (context, state) => const ReminderView(),
      ),
      GoRoute(
        path: kRepentanceView,
        builder: (context, state) => const RepentanceView(),
      ),
      GoRoute(
        path: kSupplicationView,
        builder: (context, state) => const SupplicationView(),
      ),
      GoRoute(
        path: kSurahDetailsView,
        builder: (context, state) => const SurahDetailsView(),
      ),
      GoRoute(
        path: kSurahDetailsViewSupplication,
        builder: (context, state) => const SurahDetailsViewSupplication(),
      ),

      GoRoute(
        path: '${AppRouter.kCollectionView}/:collectionIndex',
        builder: (context, state) {
          final int collectionIndex =
              int.parse(state.pathParameters['collectionIndex']!);
          return BlocProvider(
            create: (context) => BuildBookmarksCollectionCubit(),
            child: CollectionView(collectionIndex: collectionIndex),
          );
        },
      ),
    ],
  );
}
