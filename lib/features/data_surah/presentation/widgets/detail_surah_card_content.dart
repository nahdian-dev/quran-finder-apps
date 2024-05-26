import 'package:flutter/material.dart';
import 'package:quran_finder_apps/cores/configuration/colors_manager.dart';

class DetailSurahCardContent extends StatelessWidget {
  final String title;
  final String content;

  const DetailSurahCardContent({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: ColorsManager.blackColor,
          ),
        ),
      ),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodySmall,
          children: [
            TextSpan(
              text: "$title: ",
              children: [
                TextSpan(text: content),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
