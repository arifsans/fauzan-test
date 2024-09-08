import 'package:fauzan_test/src/core/helper/helper.dart';
import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:fauzan_test/src/shared/domain/models/wellness.dart';
import 'package:flutter/material.dart';

class WellnessDetailPage extends StatelessWidget {
  const WellnessDetailPage({
    super.key,
    required this.heroTag,
    required this.wellness,
  });

  final String heroTag;
  final Wellness wellness;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightestGray,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.chevron_left_outlined,
            size: 32,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          wellness.judul,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Hero(
                      tag: heroTag,
                      child: Image.asset(
                        wellness.gambar,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            wellness.judul,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            wellness.tipe,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.share_outlined,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Helper.rupiahFormatter('${wellness.harga}'),
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.blueGray,
                  ),
                ),
                const SizedBox(width: 12),
                Row(
                  children: [
                    Text(
                      'Min. Pembelian : ${wellness.minQty}',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Max. Pembelian : ${wellness.maxQty}',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                wellness.deskripsi,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
