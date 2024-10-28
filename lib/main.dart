import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurankareem/core/utils/service_locator.dart';

import 'core/utils/resources/routes_manager.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/manger/fetch_quran_cubit/fetch_quran_cubit.dart';
import 'features/main/presentation/manger/theme_cubit/theme_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) =>
          FetchQuranCubit(
            getIt.get<HomeRepoImpl>(),
          )
            ..fetchQuran(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: theme,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
