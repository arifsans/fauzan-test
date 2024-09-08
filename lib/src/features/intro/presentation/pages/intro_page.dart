import 'package:fauzan_test/src/core/helper/helper.dart';
import 'package:fauzan_test/src/core/router/app_route_enum.dart';
import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  String _appVersion = '';
  PackageInfo? packageInfo;

  Future<void> _getAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _appVersion = packageInfo.version;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get app version: $e');
      }
    }
  }

  @override
  void initState() {
    _getAppVersion().then(
      (value) => Future.delayed(
        const Duration(seconds: 1),
        () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouteEnum.bottomNavPage.name,
            (route) => false,
          );
        },
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              Helper.getImagePath("img_logo.png"),
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 20,
            child: Text(
              'Versi : $_appVersion',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
