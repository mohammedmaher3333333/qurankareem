import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurankareem/features/repentance/presentation/manger/quran_player_repentace_cubit/quran_player_repentance_cubit.dart';
import 'package:qurankareem/features/repentance/presentation/views/widgets/surah_list_view_repentance.dart';

class RepentanceView extends StatelessWidget {
  const RepentanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranPlayerRepentanceCubit(),
      child: const SurahListViewRepentance(),
    );
  }
}
