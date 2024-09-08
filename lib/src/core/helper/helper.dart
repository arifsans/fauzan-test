import 'package:fauzan_test/src/core/utils/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helper {
  /// Get svg picture path
  static String getSvgPath(String name) {
    return "$svgPath$name";
  }

  /// Get image picture path
  static String getImagePath(String name) {
    return "$imagePath$name";
  }

  /// Get greeting by time
  static String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Selamat Pagi';
    } else if (hour >= 12 && hour < 18) {
      return 'Selamat Siang';
    } else if (hour >= 18 && hour < 21) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  static String rupiahFormatter(String? value) {
    if (value == null || value == 'null' || value == "") {
      value = "0";
    }

    return NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(double.parse(value));
  }

  static Future<T?> showBottomSheet<T>(
    BuildContext context,
    Widget bottomsheet, {
    EdgeInsetsGeometry? padding,
  }) {
    return showModalBottomSheet<T>(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        const borderRadius = Radius.circular(20);

        return Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 2,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: borderRadius,
              topRight: borderRadius,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: padding ?? const EdgeInsets.all(25),
            child: bottomsheet,
          ),
        );
      },
    );
  }
}
