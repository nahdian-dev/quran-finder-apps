import 'package:dartz/dartz.dart';

import 'package:quran_finder_apps/cores/error/failure.dart';
import 'package:quran_finder_apps/features/data_surah/domain/entities/data_surah.dart';
import 'package:quran_finder_apps/features/data_surah/domain/repositories/data_surah_repository.dart';

class GetDataSurah {
  final DataSurahRepository dataSurahRepository;
  GetDataSurah({required this.dataSurahRepository});

  Future<Either<Failure, List<DataSurah>>> call() async {
    return await dataSurahRepository.getDataSurah();
  }
}
