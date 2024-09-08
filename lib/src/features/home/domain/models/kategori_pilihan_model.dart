import 'package:json_annotation/json_annotation.dart';

part 'kategori_pilihan_model.g.dart';

@JsonSerializable()
class KategoriPilihanModel {
  final String gambar, judul;

  KategoriPilihanModel({
    required this.gambar,
    required this.judul,
  });

  factory KategoriPilihanModel.fromJson(Map<String, dynamic> json) =>
      _$KategoriPilihanModelFromJson(json);
  Map<String, dynamic> toJson() => _$KategoriPilihanModelToJson(this);
}
