// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionsResponseModel _$SectionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    SectionsResponseModel(
      json['General'] as String?,
      json['Neurologic'] as String?,
      json['Pediatric'] as String?,
      json['Radiology'] as String?,
    );

Map<String, dynamic> _$SectionsResponseModelToJson(
        SectionsResponseModel instance) =>
    <String, dynamic>{
      'General': instance.general,
      'Neurologic': instance.neurologic,
      'Pediatric': instance.pediatric,
      'Radiology': instance.radiology,
    };
