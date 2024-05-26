import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_finder_apps/cores/error/failure.dart';
import 'package:quran_finder_apps/features/data_surah/domain/entities/data_surah.dart';
import 'package:quran_finder_apps/features/data_surah/domain/usecases/get_data_surah.dart';

part 'data_surah_event.dart';

part 'data_surah_state.dart';

class DataSurahBloc extends Bloc<DataSurahEvent, DataSurahState> {
  GetDataSurah getDataSurah;

  DataSurahBloc({required this.getDataSurah}) : super(DataSurahInitial()) {
    on<DataSurahEvent>((event, emit) async {
      try {
        emit(DataSurahLoading());
        Either<Failure, List<DataSurah>> dataSurah = await getDataSurah.call();

        dataSurah.fold((l) {
          if (l is ServerFailure) {
            emit(DataSurahStateError(message: l.message));
          }
          if (l is GeneralFailure) {
            emit(DataSurahStateError(message: l.message));
          }
          if (l is NetworkFailure) {
            emit(DataSurahStateError(message: l.message));
          }
          // emit(const DataSurahStateError(message: 'Cannot get data surah!'));
        }, (r) {
          emit(DataSurahLoaded(dataSurah: r));
        });
      } catch (e) {
        emit(const DataSurahStateError(message: 'Cannot get data surah!'));
      }
    });
  }
}
