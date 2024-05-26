import 'package:json_annotation/json_annotation.dart';
import 'package:quran_finder_apps/features/data_surah/domain/entities/data_surah.dart';

part 'data_surah_model.g.dart';

@JsonSerializable()
class DataSurahModel extends DataSurah {
  @JsonKey(name: "numberOfAyahs")
  final int? numberOfAyahs;

  const DataSurahModel({
    required int? number,
    required this.numberOfAyahs,
    required String name,
    required String translation,
    required String revelation,
    required String description,
  }) : super(
          number: number,
          totalAyah: numberOfAyahs,
          name: name,
          translation: translation,
          revelation: revelation,
          description: description,
        );

  factory DataSurahModel.fromJson(Map<String, dynamic> json) =>
      _$DataSurahModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataSurahModelToJson(this);
}
