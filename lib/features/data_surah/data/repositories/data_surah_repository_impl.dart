import 'package:dartz/dartz.dart';

import 'package:quran_finder_apps/cores/error/failure.dart';
import 'package:quran_finder_apps/features/data_surah/data/data_sources/data_surah_remote_data_source.dart';
import 'package:quran_finder_apps/features/data_surah/domain/entities/data_surah.dart';
import 'package:quran_finder_apps/features/data_surah/domain/repositories/data_surah_repository.dart';
import 'package:quran_finder_apps/cores/services/network_service.dart';

class DataSurahRepositoryImpl extends DataSurahRepository {
  final DataSurahRemoteDataSource dataSurahRemoteDataSource;
  final NetworkService networkService;

  DataSurahRepositoryImpl({
    required this.dataSurahRemoteDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<DataSurah>>> getDataSurah() async {
    try {
      bool isConnected = await networkService.isConnected();

      if (isConnected == false) {
        return const Left(NetworkFailure(message: 'No internet condition'));
      }

      return Right(await dataSurahRemoteDataSource.getDataSurah());
    } catch (e) {
      return const Left(GeneralFailure(message: 'Cannot get all data user'));
    }
  }
}