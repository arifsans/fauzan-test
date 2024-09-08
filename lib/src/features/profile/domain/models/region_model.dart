import 'package:json_annotation/json_annotation.dart';

part 'region_model.g.dart';

@JsonSerializable()
class RegionModel {
  final String id;
  final String nama;

  RegionModel({required this.id, required this.nama});

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionModelToJson(this);
}
