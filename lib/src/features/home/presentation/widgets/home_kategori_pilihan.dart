import 'package:fauzan_test/src/core/helper/helper.dart';
import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:fauzan_test/src/features/home/domain/models/kategori_pilihan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeKategoriPilihan extends StatefulWidget {
  const HomeKategoriPilihan({
    super.key,
  });

  @override
  State<HomeKategoriPilihan> createState() => _HomeKategoriPilihanState();
}

class _HomeKategoriPilihanState extends State<HomeKategoriPilihan> {
  final List<KategoriPilihanModel> _kategoriPilihan = [
    KategoriPilihanModel(
      gambar: Helper.getSvgPath("img_hobi.svg"),
      judul: "Hobi",
    ),
    KategoriPilihanModel(
      gambar: Helper.getSvgPath("img_merchandise.svg"),
      judul: "Merchandise",
    ),
    KategoriPilihanModel(
      gambar: Helper.getSvgPath("img_gaya_hidup_sehat.svg"),
      judul: "Gaya Hidup Sehat",
    ),
    KategoriPilihanModel(
      gambar: Helper.getSvgPath("img_konseling_n_rohani.svg"),
      judul: "Konseling & Rohani",
    ),
    KategoriPilihanModel(
      gambar: Helper.getSvgPath("img_self_development.svg"),
      judul: "Self Development",
    ),
    KategoriPilihanModel(
      gambar: Helper.getSvgPath("img_perencanaan_keuangan.svg"),
      judul: "Perencanaan Keuangan",
    ),
    KategoriPilihanModel(
      gambar: Helper.getSvgPath("img_konsultasi_medis.svg"),
      judul: "Konsultasi Medis",
    ),
    KategoriPilihanModel(
      gambar: Helper.getSvgPath("img_lihat_semua.svg"),
      judul: "Lihat Semua",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Kategori Pilihan',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.lightGray,
              ),
              child: Row(
                children: [
                  const Text(
                    'Wishlist',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 8,
          physics: const NeverScrollableScrollPhysics(),
          children: _kategoriPilihan
              .map(
                (item) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      item.gambar,
                      height: 40,
                    ),
                    Text(
                      item.judul,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
