part of 'data_surah_bloc.dart';

abstract class DataSurahState extends Equatable {
  const DataSurahState([List<dynamic> props = const <dynamic>[]]);
}

class DataSurahInitial extends DataSurahState {
  @override
  List<Object> get props => [];
}

class DataSurahLoading extends DataSurahState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DataSurahStateError extends DataSurahState {
  final String message;

  const DataSurahStateError({required this.message});

  @override
  List<Object?> get props => [message];
}

// ======== LOADED STATE =======
class DataSurahLoaded extends DataSurahState {
  final List<DataSurah> dataSurah;

  const DataSurahLoaded({required this.dataSurah});

  @override
  // TODO: implement props
  List<Object?> get props => [dataSurah];

}