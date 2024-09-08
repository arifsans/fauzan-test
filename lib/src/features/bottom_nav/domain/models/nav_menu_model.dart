import 'package:json_annotation/json_annotation.dart';

part 'nav_menu_model.g.dart';

@JsonSerializable()
class NavMenuModel {
  final String gambar, judul;

  NavMenuModel({
    required this.gambar,
    required this.judul,
  });

  factory NavMenuModel.fromJson(Map<String, dynamic> json) =>
      _$NavMenuModelFromJson(json);
  Map<String, dynamic> toJson() => _$NavMenuModelToJson(this);
}
