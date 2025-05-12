// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListDoctors _$ListDoctorsFromJson(Map<String, dynamic> json) => ListDoctors(
      json['clinic'] as String?,
      json['description'] as String?,
      json['working_hours'] == null
          ? null
          : WorkingHours.fromJson(
              json['working_hours'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
      json['image'] as String?,
      (json['late'] as num?)?.toDouble(),
      json['name'] as String?,
      json['phone'] as String?,
      json['specialty'] as String?,
      json['reviews'] as String?,
      (json['available_time'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ListDoctorsToJson(ListDoctors instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'phone': instance.phone,
      'available_time': instance.availableTime,
      'reviews': instance.reviews,
      'late': instance.late,
      'specialty': instance.specialty,
      'working_hours': instance.hours,
      'clinic': instance.clinic,
      'description': instance.description,
    };

WorkingHours _$WorkingHoursFromJson(Map<String, dynamic> json) => WorkingHours(
      json['friday'] as String?,
      json['monday'] as String?,
      json['saturday'] as String?,
      json['sunday'] as String?,
      json['thursday'] as String?,
      json['tuesday'] as String?,
      json['wednesday'] as String?,
    );

Map<String, dynamic> _$WorkingHoursToJson(WorkingHours instance) =>
    <String, dynamic>{
      'friday': instance.friday,
      'monday': instance.monday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
      'thursday': instance.thursday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
    };
