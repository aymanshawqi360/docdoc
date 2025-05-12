import 'package:json_annotation/json_annotation.dart';

part 'book_appointment_response_model.g.dart';

@JsonSerializable()
class BookAppointmentResponseModel {
  final String name;

  BookAppointmentResponseModel({required this.name});

  factory BookAppointmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentResponseModelToJson(this);
}
