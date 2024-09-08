import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String nama, tglLahir, jenisKelamin, email, noHp;
  final String? pendidikan,
      statusPernikahan,
      nik,
      alamat,
      provinsi,
      kota,
      kecamatan,
      kelurahan,
      kodePos,
      namaUsaha,
      alamatUsaha,
      jabatan,
      lamaBekerja,
      sumberPendapatan,
      pendapatanKotorPertahun,
      namaBank,
      cabangBank,
      namaPemilikRekening;

  User({
    this.id,
    required this.nama,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.email,
    required this.noHp,
    this.pendidikan,
    this.statusPernikahan,
    this.nik,
    this.alamat,
    this.provinsi,
    this.kota,
    this.kecamatan,
    this.kelurahan,
    this.kodePos,
    this.namaUsaha,
    this.alamatUsaha,
    this.jabatan,
    this.lamaBekerja,
    this.sumberPendapatan,
    this.pendapatanKotorPertahun,
    this.namaBank,
    this.cabangBank,
    this.namaPemilikRekening,
  });
}
