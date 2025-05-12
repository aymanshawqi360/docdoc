import 'package:json_annotation/json_annotation.dart';

part 'get_data_user.g.dart';

@JsonSerializable()
class GetDataUser {
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

  GetDataUser(
    this.patientId,
    this.patientName,
    this.doctorId,
    this.doctorName,
    this.bookingDate,
    this.bookingTime,
    this.paymentMethod,
  );

  factory GetDataUser.fromJson(Map<String, dynamic> json) =>
      _$GetDataUserFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataUserToJson(this);
}
