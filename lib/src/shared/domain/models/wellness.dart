import 'package:floor/floor.dart';

@entity
class Wellness {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String gambar, judul, tipe, urlShare, deskripsi;
  final int harga, minQty, maxQty;

  Wellness({
    this.id,
    required this.gambar,
    required this.judul,
    required this.tipe,
    required this.urlShare,
    required this.deskripsi,
    required this.harga,
    required this.minQty,
    required this.maxQty,
  });
}
