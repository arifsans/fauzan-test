import 'package:fauzan_test/src/features/home/presentation/widgets/home_explore_wellness.dart';
import 'package:fauzan_test/src/features/home/presentation/widgets/home_header.dart';
import 'package:fauzan_test/src/features/home/presentation/widgets/home_kategori_pilihan.dart';
import 'package:fauzan_test/src/features/home/presentation/widgets/home_produk_keuangan.dart';
import 'package:fauzan_test/src/features/home/presentation/widgets/home_switch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeHeader(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: const [
                HomeSwitch(),
                SizedBox(height: 12),
                HomeProdukKeuangan(),
                SizedBox(height: 12),
                HomeKategoriPilihan(),
                SizedBox(height: 12),
                HomeExploreWellness(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
