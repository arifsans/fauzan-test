import 'package:fauzan_test/src/core/helper/helper.dart';
import 'package:fauzan_test/src/features/home/domain/models/produk_keuangan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeProdukKeuangan extends StatefulWidget {
  const HomeProdukKeuangan({
    super.key,
  });
  @override
  State<HomeProdukKeuangan> createState() => _HomeProdukKeuanganState();
}

class _HomeProdukKeuanganState extends State<HomeProdukKeuangan> {
  final List<ProdukKeuanganModel> _produkKeuangan = [
    ProdukKeuanganModel(
      gambar: Helper.getSvgPath("img_urun.svg"),
      judul: "Urun",
    ),
    ProdukKeuanganModel(
      gambar: Helper.getSvgPath("img_pembiayaan_porsi_haji.svg"),
      judul: "Pembiayaan Porsi Haji",
    ),
    ProdukKeuanganModel(
      gambar: Helper.getSvgPath("img_financial_checkup.svg"),
      judul: "Financial Check Up",
    ),
    ProdukKeuanganModel(
      gambar: Helper.getSvgPath("img_asuransi_mobil.svg"),
      judul: "Asuransi Mobil",
    ),
    ProdukKeuanganModel(
      gambar: Helper.getSvgPath("img_asuransi_properti.svg"),
      judul: "Asuransi Properti",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Produk Keuangan',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 8,
          physics: const NeverScrollableScrollPhysics(),
          children: _produkKeuangan
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
