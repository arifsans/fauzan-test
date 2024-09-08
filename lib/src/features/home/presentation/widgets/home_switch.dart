import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeSwitch extends StatelessWidget {
  const HomeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.lightestGray,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ToggleSwitch(
        minWidth: double.maxFinite,
        cornerRadius: 20.0,
        activeBgColors: const [
          [AppColors.primaryColor],
          [AppColors.primaryColor]
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: AppColors.lightestGray,
        inactiveFgColor: AppColors.lightGray,
        initialLabelIndex: 0,
        totalSwitches: 2,
        labels: const ['Payuung Pribadi', 'Payuung Karyawan'],
        fontSize: 12,
        radiusStyle: true,
        onToggle: (index) {
          if (kDebugMode) {
            print('switched to: $index');
          }
        },
      ),
    );
  }
}
