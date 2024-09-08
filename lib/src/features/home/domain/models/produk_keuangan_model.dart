import 'package:json_annotation/json_annotation.dart';

part 'produk_keuangan_model.g.dart';

@JsonSerializable()
class ProdukKeuanganModel {
  final String gambar, judul;

  ProdukKeuanganModel({
    required this.gambar,
    required this.judul,
  });

  factory ProdukKeuanganModel.fromJson(Map<String, dynamic> json) =>
      _$ProdukKeuanganModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProdukKeuanganModelToJson(this);
}
