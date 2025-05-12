// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAppointmentRequestModel _$BookAppointmentRequestModelFromJson(
        Map<String, dynamic> json) =>
    BookAppointmentRequestModel(
      patientId: json['patient_id'] as String,
      patientName: json['patient_name'] as String,
      doctorId: (json['doctor_id'] as num).toInt(),
      doctorName: json['doctor_name'] as String,
      bookingDate: DateTime.parse(json['booking_date'] as String),
      bookingTime: json['booking_time'] as String,
      paymentMethod: json['payment_method'] as String,
    );

Map<String, dynamic> _$BookAppointmentRequestModelToJson(
        BookAppointmentRequestModel instance) =>
    <String, dynamic>{
      'patient_id': instance.patientId,
      'patient_name': instance.patientName,
      'doctor_id': instance.doctorId,
      'doctor_name': instance.doctorName,
      'booking_date': instance.bookingDate.toIso8601String(),
      'booking_time': instance.bookingTime,
      'payment_method': instance.paymentMethod,
    };
