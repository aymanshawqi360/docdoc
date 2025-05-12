import 'package:json_annotation/json_annotation.dart';

part 'book_appointment_request_model.g.dart';

@JsonSerializable()
class BookAppointmentRequestModel {
  @JsonKey(name: 'patient_id')
  final String patientId;

  @JsonKey(name: 'patient_name')
  final String patientName;

  @JsonKey(name: 'doctor_id')
  final int doctorId;

  @JsonKey(name: 'doctor_name')
  final String doctorName;

  @JsonKey(name: 'booking_date')
  final DateTime bookingDate;

  @JsonKey(name: 'booking_time')
  final String bookingTime;

  @JsonKey(name: 'payment_method')
  final String paymentMethod;

  BookAppointmentRequestModel({
    required this.patientId,
    required this.patientName,
    required this.doctorId,
    required this.doctorName,
    required this.bookingDate,
    required this.bookingTime,
    required this.paymentMethod,
  });

  factory BookAppointmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentRequestModelToJson(this);
}
