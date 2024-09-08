import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileStepper extends StatelessWidget {
  final double width;
  final int totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;
  final ValueChanged<int> onStepTapped;

  const ProfileStepper({
    super.key,
    required this.width,
    required this.totalSteps,
    required this.curStep,
    required this.stepCompleteColor,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth,
    required this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 24.0,
        right: 24.0,
      ),
      width: width,
      child: Row(
        children: _steps(),
      ),
    );
  }

  Color getCircleColor(int i) {
    if (i + 1 < curStep) {
      return stepCompleteColor;
    } else if (i + 1 == curStep) {
      return currentStepColor;
    } else {
      return AppColors.primaryColor.withOpacity(.3);
    }
  }

  LinearGradient getLineGradient(int i) {
    if (curStep == 1 && i == 0) {
      return LinearGradient(
        colors: [
          AppColors.primaryColor,
          AppColors.primaryColor.withOpacity(.3)
        ],
        stops: const [0.5, 0.5],
      );
    } else if (i + 1 < curStep) {
      return const LinearGradient(
        colors: [AppColors.primaryColor, AppColors.primaryColor],
      );
    } else if (i + 1 == curStep && curStep != totalSteps) {
      return LinearGradient(
        colors: [
          AppColors.primaryColor,
          AppColors.primaryColor.withOpacity(.3),
          AppColors.primaryColor.withOpacity(.3),
        ],
        stops: const [0.0, 0.5, 1.0],
      );
    } else if (curStep == totalSteps && i == totalSteps - 2) {
      return const LinearGradient(
        colors: [AppColors.primaryColor, AppColors.primaryColor],
      );
    } else {
      return LinearGradient(
        colors: [
          AppColors.primaryColor.withOpacity(.3),
          AppColors.primaryColor.withOpacity(.3)
        ],
      );
    }
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      list.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Material(
            child: InkWell(
              onTap: () {
                onStepTapped(i + 1);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: getCircleColor(i),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: getInnerElementOfStepper(i),
              ),
            ),
          ),
        ),
      );

      if (i != totalSteps - 1) {
        list.add(
          Expanded(
            child: Container(
              height: lineWidth,
              decoration: BoxDecoration(
                gradient: getLineGradient(i),
              ),
            ),
          ),
        );
      }
    }

    return list;
  }

  Widget getInnerElementOfStepper(int index) {
    return Center(
      child: Text(
        '${index + 1}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
