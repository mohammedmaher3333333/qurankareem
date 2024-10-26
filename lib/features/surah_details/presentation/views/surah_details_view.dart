import 'package:flutter/material.dart';
import 'package:qurankareem/features/surah_details/presentation/views/widgets/surah_details_view_body.dart';

class SurahDetailsView extends StatelessWidget {
  const SurahDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SurahDetailsViewBody(),
      ),
    );
  }
}
