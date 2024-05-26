// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSurahModel _$DataSurahModelFromJson(Map<String, dynamic> json) =>
    DataSurahModel(
      number: json['number'] as int?,
      numberOfAyahs: json['numberOfAyahs'] as int?,
      name: json['name'] as String,
      translation: json['translation'] as String,
      revelation: json['revelation'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$DataSurahModelToJson(DataSurahModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'translation': instance.translation,
      'revelation': instance.revelation,
      'description': instance.description,
      'numberOfAyahs': instance.numberOfAyahs,
    };
