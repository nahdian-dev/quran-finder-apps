import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:quran_finder_apps/cores/services/network_service.dart';
import 'package:quran_finder_apps/features/data_surah/data/data_sources/data_surah_remote_data_source.dart';
import 'package:quran_finder_apps/features/data_surah/data/repositories/data_surah_repository_impl.dart';
import 'package:quran_finder_apps/features/data_surah/domain/repositories/data_surah_repository.dart';
import 'package:quran_finder_apps/features/data_surah/domain/usecases/get_data_surah.dart';
import 'package:quran_finder_apps/features/data_surah/presentation/bloc/data_surah_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencyInjection() async {
  // Presentation layer - Bloc
  serviceLocator.registerLazySingleton(
    () => DataSurahBloc(
      getDataSurah: serviceLocator.call(),
    ),
  );

  //Domain layer - Usecases
  serviceLocator.registerLazySingleton(
    () => GetDataSurah(
      dataSurahRepository: serviceLocator.call(),
    ),
  );

  // Domain layer dan data layer - repository
  serviceLocator.registerLazySingleton<DataSurahRepository>(
    () => DataSurahRepositoryImpl(
      dataSurahRemoteDataSource: serviceLocator.call(),
      networkService: serviceLocator.call(),
    ),
  );

  //Data layer - Datasource
  serviceLocator.registerLazySingleton<DataSurahRemoteDataSource>(
    () => DataSurahRemoteDataSourceImpl(),
  );

  // services
  serviceLocator.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(),
  );

  serviceLocator.registerLazySingleton(
    () => Connectivity(),
  );

}
