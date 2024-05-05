import 'package:flutter/material.dart';

class DetailSelectedSurahWidget extends StatelessWidget {
  const DetailSelectedSurahWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text('Nama Surah: Al-Fatihah'),
    );
  }
}
