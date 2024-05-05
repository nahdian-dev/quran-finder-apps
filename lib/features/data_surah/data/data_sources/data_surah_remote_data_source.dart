import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_finder_apps/cores/error/failure.dart';

import 'package:quran_finder_apps/features/data_surah/data/models/data_surah_model.dart';

abstract class DataSurahRemoteDataSource {
  Future<List<DataSurahModel>> getDataSurah();
}

class DataSurahRemoteDataSourceImpl extends DataSurahRemoteDataSource {
  @override
  Future<List<DataSurahModel>> getDataSurah() async {
    try {
      String url = "https://quran-verse-explorer.vercel.app/surah";
      var response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) {
        return Future.error(ServerFailure(
            message: 'Error status code: ${response.statusCode}'));
      }

      List<dynamic>? listData = jsonDecode(response.body);

      if (listData == null) {
        return Future.error(const GeneralFailure(message: 'Null data'));
      }

      return listData
          .map((e) => DataSurahModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return Future.error(GeneralFailure(message: 'Cant get data surah: $e'));
    }
  }
}
