part of 'data_surah_bloc.dart';

abstract class DataSurahEvent extends Equatable {
  const DataSurahEvent([List<dynamic> props = const <dynamic>[]]);
}

class DataSurahEventGetDataSurah extends DataSurahEvent {
  @override
  List<Object?> get props => [];
}
