import 'package:flutter/material.dart';
import 'package:quran_finder_apps/features/data_surah/presentation/widgets/detail_selected_surah_widget.dart';

class DetailSurahPage extends StatelessWidget {
  const DetailSurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al-Fatihah'),
      ),
      body: Column(
        children: [
          DetailSelectedSurahWidget(),
        ],
      ),
    );
  }
}
