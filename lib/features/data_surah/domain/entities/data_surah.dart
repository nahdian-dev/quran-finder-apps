import 'package:equatable/equatable.dart';

class DataSurah extends Equatable {
  final int? number;
  final int? totalAyah;
  final String name;
  final String translation;
  final String revelation;
  final String description;

  const DataSurah({
    required this.number,
    required this.totalAyah,
    required this.name,
    required this.translation,
    required this.revelation,
    required this.description,
  });

  @override
  List<Object?> get props => [
        number,
        totalAyah,
        name,
        translation,
        revelation,
        description,
      ];
}
