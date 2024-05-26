import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_finder_apps/cores/configuration/colors_manager.dart';
import 'package:quran_finder_apps/features/data_surah/presentation/widgets/detail_surah_card_content.dart';

class DetailSurahPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const DetailSurahPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorsManager.blackColor,
          ),
        ),
      ),
      body: Card(
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorsManager.blackColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: ColorsManager.blackColor,
                  ),
                ),
              ),
              child: Text(
                "${data['name']} (${data['number']})",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),

            // CONTENT
            DetailSurahCardContent(
              title: "Arti",
              content: data['translation'],
            ),
            DetailSurahCardContent(
              title: "Diturunkan",
              content: data['revelation'],
            ),
            DetailSurahCardContent(
              title: "Jumlah Ayat",
              content: data['totalAyah'].toString(),
            ),
            DetailSurahCardContent(
              title: "Description",
              content: data['description'],
            ),
          ],
        ),
      ),
    );
  }
}
