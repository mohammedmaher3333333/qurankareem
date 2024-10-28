import 'package:flutter/material.dart';
import 'package:qurankareem/features/supplication/presentation/views/widgets/surah_details_view_supplication_body.dart';

class SurahDetailsViewSupplication extends StatelessWidget {
  const SurahDetailsViewSupplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SurahDetailsViewSupplicationBody(),
      ),
    );
  }
}
