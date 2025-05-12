import 'package:json_annotation/json_annotation.dart';

part 'search_response_model.g.dart';

@JsonSerializable()
class ListDoctors {
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
  ListDoctors(
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
  factory ListDoctors.fromJson(Map<String, dynamic> json) =>
      _$ListDoctorsFromJson(json);

  Map<String, dynamic> toJson() => _$ListDoctorsToJson(this);
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
