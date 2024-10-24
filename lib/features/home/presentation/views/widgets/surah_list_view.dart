import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qurankareem/core/widgets/custom_error_widget.dart';
import 'package:qurankareem/core/widgets/custom_loading_indicator.dart';
import 'package:qurankareem/features/home/presentation/manger/fetch_quran_cubit/fetch_quran_cubit.dart';
import 'package:qurankareem/features/home/presentation/views/widgets/surah_list_item.dart';

import '../../../../../core/utils/resources/routes_manager.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchQuranCubit, FetchQuranState>(
      builder: (context, state) {
        if (state is FetchQuranLoading) {
          return const CustomLoadingIndicator();
        } else if (state is FetchQuranFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is FetchQuranSuccess) {
          final surahs = state.quran;
          if (surahs.isEmpty) {
            return Center(child: Text('No Surahs available'));
          }
          print('Fetched Surahs: ${surahs.length}');
          return Expanded(
            child: ListView.builder(
              itemCount: surahs.length,
              itemBuilder: (context, index) {
                final surah = surahs[index];
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kSurahDetailsView,
                      extra: surah,
                    );
                  },
                  child: SurahListItem(
                    surah: surah,
                    index: index,
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
