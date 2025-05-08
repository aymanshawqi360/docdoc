import 'package:json_annotation/json_annotation.dart';

part 'sections_response_model.g.dart';

@JsonSerializable()
class SectionsResponseModel {
  @JsonKey(name: "General")
  String? general;
  @JsonKey(name: "Neurologic")
  String? neurologic;
  @JsonKey(name: "Pediatric")
  String? pediatric;
  @JsonKey(name: "Radiology")
  String? radiology;

  SectionsResponseModel(
      this.general, this.neurologic, this.pediatric, this.radiology);
  factory SectionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SectionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SectionsResponseModelToJson(this);
}
