import 'package:go_router/go_router.dart';
import 'package:qurankareem/features/Reminder/presentation/views/reminder_view.dart';
import 'package:qurankareem/features/main/presentation/views/main_view.dart';
import 'package:qurankareem/features/repentance/presentation/views/repentance_view.dart';
import 'package:qurankareem/features/supplication/presentation/views/supplication_view.dart';
import 'package:qurankareem/features/surah_details/presentation/views/surah_details_view.dart';

import '../../../features/bookmarks/presentation/views/bookmarks_view.dart';
import '../../../features/home/presentation/views/home_view.dart';
import '../../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kMainView = '/mainView';
  static const kHomeView = '/homeView';
  static const kBookmarksView = '/bookmarksView';
  static const kSurahDetailsView = '/surahDetails';
  static const kReminderView = '/reminderView';
  static const kRepentanceView = '/repentanceView';
  static const kSupplicationView = '/supplicationView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kMainView,
        builder: (context, state) => const MainView(),
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
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
      //     child: BookDetailsView(
      //       bookModel: state.extra as BookModel,
      //     ),
      //   ),
      // ),
      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SearchCubit(getIt.get<SearchRepoImpl>())..fetchSearchBooks(),
      //     child: const SearchView(),
      //   ),
      // ),
    ],
  );
}
