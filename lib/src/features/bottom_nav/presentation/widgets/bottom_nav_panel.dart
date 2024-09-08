import 'dart:math' as math;
import 'package:collection/collection.dart';
import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:fauzan_test/src/features/bottom_nav/domain/models/nav_menu_model.dart';
import 'package:fauzan_test/src/features/bottom_nav/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:fauzan_test/src/features/bottom_nav/presentation/bloc/sliding_panel/sliding_panel_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomNavPanel extends StatelessWidget {
  const BottomNavPanel({
    super.key,
    required List<NavMenuModel> navMenu,
    required this.panelController,
  }) : _navMenu = navMenu;

  final List<NavMenuModel> _navMenu;
  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.gray, width: 0.5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) => state.map(
              loaded: (active) {
                return GridView.count(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 8,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _navMenu
                      .mapIndexed(
                        (index, item) => GestureDetector(
                          onTap: () {
                            context.read<BottomNavBloc>().add(
                                  BottomNavEvent.changeIndex(index),
                                );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                item.gambar,
                                height: 40,
                              ),
                              Text(
                                item.judul,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: active.index == index
                                      ? AppColors.primaryColor
                                      : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            transform: Matrix4.translationValues(0, 2, 0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const MyArc(),
                BlocBuilder<SlidingPanelBloc, SlidingPanelState>(
                  builder: (context, state) => state.map(
                    loaded: (val) {
                      if (val.isOpen) {
                        return GestureDetector(
                          onTap: () {
                            panelController.close();
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.blueGray,
                            size: 30,
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            panelController.open();
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_up,
                            color: AppColors.blueGray,
                            size: 30,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyArc extends StatelessWidget {
  final double width;
  final double height;

  const MyArc({super.key, this.width = 50, this.height = 30});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(width, height),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the filled arc
    Paint fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Paint for the border
    Paint borderPaint = Paint()
      ..color = AppColors.gray // Change this to the desired border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = .5; // Change this to the desired border width

    // Draw the filled oval arc
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      math.pi,
      math.pi,
      false,
      fillPaint,
    );

    // Draw the border oval arc
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      math.pi,
      math.pi,
      false,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
