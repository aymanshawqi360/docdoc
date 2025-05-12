import 'package:json_annotation/json_annotation.dart';
part 'doctors_response_model.g.dart';

@JsonSerializable()
class DoctorsResponseModel {
  @JsonKey(name: 'Doctor')
  List<Doctor>? doctorItemList;
  @JsonKey(name: 'neurologist')
  List<Doctor>? neurologistItemList;
  @JsonKey(name: 'pediatric')
  List<Doctor>? pediatricItemList;
  @JsonKey(name: 'radiology')
  List<Doctor>? radiologyItemList;
  DoctorsResponseModel(
    this.doctorItemList,
    this.neurologistItemList,
    this.pediatricItemList,
    this.radiologyItemList,
  );
  factory DoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorsResponseModelToJson(this);
}

@JsonSerializable()
class Doctor {
  final int? id;
  final String? image;
  final String? name;
  final String? phone;
  @JsonKey(name: "available_time")
  final List<String> availableTime;
  final String? reviews;
  final double? late;
  final String? specialty;
  @JsonKey(name: "working_hours")
  final WorkingHours? hours;
  final String? clinic;
  final String? description;
  Doctor(
      this.clinic,
      this.description,
      this.hours,
      this.id,
      this.image,
      this.late,
      this.name,
      this.phone,
      this.specialty,
      this.reviews,
      this.availableTime);
  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class WorkingHours {
  String? friday;
  String? monday;
  String? saturday;
  String? sunday;
  String? thursday;
  String? tuesday;
  String? wednesday;

  WorkingHours(this.friday, this.monday, this.saturday, this.sunday,
      this.thursday, this.tuesday, this.wednesday);
  factory WorkingHours.fromJson(Map<String, dynamic> json) =>
      _$WorkingHoursFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingHoursToJson(this);
}
