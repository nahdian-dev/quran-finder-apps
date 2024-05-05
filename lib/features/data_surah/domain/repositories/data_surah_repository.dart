import 'package:dartz/dartz.dart';

import 'package:quran_finder_apps/cores/error/failure.dart';
import 'package:quran_finder_apps/features/data_surah/domain/entities/data_surah.dart';

abstract class DataSurahRepository {
  Future<Either<Failure, List<DataSurah>>> getDataSurah();
}