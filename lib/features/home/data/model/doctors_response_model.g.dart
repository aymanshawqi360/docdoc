// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsResponseModel _$DoctorsResponseModelFromJson(
        Map<String, dynamic> json) =>
    DoctorsResponseModel(
      (json['Doctor'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['neurologist'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['pediatric'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['radiology'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorsResponseModelToJson(
        DoctorsResponseModel instance) =>
    <String, dynamic>{
      'Doctor': instance.DoctorItemList,
      'neurologist': instance.neurologistItemList,
      'pediatric': instance.pediatricItemList,
      'radiology': instance.radiologyItemList,
    };

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
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
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'phone': instance.phone,
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
