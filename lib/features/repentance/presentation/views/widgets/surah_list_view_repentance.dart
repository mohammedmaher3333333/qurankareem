import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';
import 'package:qurankareem/core/widgets/custom_error_widget.dart';
import 'package:qurankareem/core/widgets/custom_loading_indicator.dart';
import 'package:qurankareem/features/home/presentation/manger/fetch_quran_cubit/fetch_quran_cubit.dart';
import 'package:qurankareem/features/repentance/presentation/views/widgets/surah_list_item_repentance.dart';

import '../../manger/quran_player_repentace_cubit/quran_player_repentance_cubit.dart';

class SurahListViewRepentance extends StatelessWidget {
  const SurahListViewRepentance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchQuranCubit, FetchQuranState>(
      builder: (context, state) {
        if (state is FetchQuranLoading) {
          return const CustomLoadingIndicator();
        } else if (state is FetchQuranFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is FetchQuranSuccess) {
          final surahs = state.surah;
          if (surahs.isEmpty) {
            return const Center(child: Text(AppStrings.noSurahAvailable));
          }
          return ListView.builder(
            itemCount: surahs.length,
            itemBuilder: (context, index) {
              final surah = surahs[index];
              return GestureDetector(
                onTap: () {
                  // تمرير روابط الصوت لكل آية في السورة إلى cubit
                  List<String> ayahTracks =
                  surah.ayahs.map((ayah) => ayah.audio ?? '').toList();

                  // الحصول على حالة التشغيل الحالية
                  final playerCubit = context.read<QuranPlayerRepentanceCubit>();

                  if (playerCubit.isPlaying) {
                    // إذا كان الصوت يعمل، توقف
                    playerCubit.togglePlayPause();
                  } else {
                    // إذا لم يكن الصوت يعمل، قم بتحديث المسارات وتشغيل الصوت
                    playerCubit.updateTracks(ayahTracks);
                    playerCubit.togglePlayPause();
                  }
                },
                child: SurahListItemRepentance(
                  surah: surah,
                ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
