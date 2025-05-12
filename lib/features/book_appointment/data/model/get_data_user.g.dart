// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_data_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataUser _$GetDataUserFromJson(Map<String, dynamic> json) => GetDataUser(
      json['patient_id'] as String,
      json['patient_name'] as String,
      (json['doctor_id'] as num).toInt(),
      json['doctor_name'] as String,
      DateTime.parse(json['booking_date'] as String),
      json['booking_time'] as String,
      json['payment_method'] as String,
    );

Map<String, dynamic> _$GetDataUserToJson(GetDataUser instance) =>
    <String, dynamic>{
      'patient_id': instance.patientId,
      'patient_name': instance.patientName,
      'doctor_id': instance.doctorId,
      'doctor_name': instance.doctorName,
      'booking_date': instance.bookingDate.toIso8601String(),
      'booking_time': instance.bookingTime,
      'payment_method': instance.paymentMethod,
    };
