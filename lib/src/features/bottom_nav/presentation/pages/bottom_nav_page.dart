import 'package:fauzan_test/src/core/helper/helper.dart';
import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:fauzan_test/src/features/bottom_nav/domain/models/nav_menu_model.dart';
import 'package:fauzan_test/src/features/bottom_nav/presentation/bloc/sliding_panel/sliding_panel_bloc.dart';
import 'package:fauzan_test/src/features/bottom_nav/presentation/widgets/bottom_nav_panel.dart';
import 'package:fauzan_test/src/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  late PanelController panelController;

  final List<NavMenuModel> _navMenu = [
    NavMenuModel(
      gambar: Helper.getSvgPath("ic_beranda.svg"),
      judul: "Beranda",
    ),
    NavMenuModel(
      gambar: Helper.getSvgPath("ic_cari.svg"),
      judul: "Cari",
    ),
    NavMenuModel(
      gambar: Helper.getSvgPath("ic_keranjang.svg"),
      judul: "Keranjang",
    ),
    NavMenuModel(
      gambar: Helper.getSvgPath("ic_daftar_transaksi.svg"),
      judul: "Daftar Transaksi",
    ),
    NavMenuModel(
      gambar: Helper.getSvgPath("ic_voucher_saya.svg"),
      judul: "Vocuher Saya",
    ),
    NavMenuModel(
      gambar: Helper.getSvgPath("ic_alamat_pengiriman.svg"),
      judul: "Alamat Pengiriman",
    ),
    NavMenuModel(
      gambar: Helper.getSvgPath("ic_daftar_teman.svg"),
      judul: "Daftar Teman",
    ),
  ];

  @override
  void initState() {
    panelController = PanelController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SlidingUpPanel(
          controller: panelController,
          body: const HomePage(),
          maxHeight: 400,
          panel: BottomNavPanel(
            navMenu: _navMenu,
            panelController: panelController,
          ),
          onPanelOpened: () {
            context
                .read<SlidingPanelBloc>()
                .add(const SlidingPanelEvent.update(isOpen: false));
          },
          onPanelClosed: () {
            context
                .read<SlidingPanelBloc>()
                .add(const SlidingPanelEvent.update(isOpen: true));
          },
          backdropEnabled: true,
          backdropOpacity: 0.3,
          boxShadow: const [],
          color: Colors.transparent,
        ),
      ),
    );
  }
}
