import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class XButton extends StatefulWidget {
  const XButton({
    super.key,
    required this.child,
    this.onTap,
    this.decoration,
    this.isExpanded,
    this.contentAlignment,
    this.padding,
    this.type = XButtonType.primary,
    this.color,
    this.textStyle,
  });

  final BoxDecoration? decoration;
  final Widget child;
  final bool? isExpanded;
  final EdgeInsetsGeometry? padding;
  final Alignment? contentAlignment;
  final void Function()? onTap;
  final XButtonType type;
  final Color? color;
  final TextStyle? textStyle;

  @override
  State<XButton> createState() => _XButtonState();
}

class _XButtonState extends State<XButton>
    with SingleTickerProviderStateMixin<XButton> {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(
        () {
          setState(() {});
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    final scaleAnimation = CurvedAnimation(
        parent: Tween<double>(begin: 1, end: .9).animate(_animationController),
        curve: Curves.easeInOut);
    final enabled = widget.onTap != null;
    final isPrimary = widget.type == XButtonType.primary;

    return Opacity(
      opacity: enabled ? 1 : .5,
      child: Transform.scale(
        scale: scaleAnimation.value,
        child: Container(
          alignment: Alignment.center,
          decoration: widget.decoration ??
              BoxDecoration(
                color: widget.color ??
                    (isPrimary ? AppColors.primaryColor : Colors.white),
                borderRadius: BorderRadius.circular(4),
              ),
          clipBehavior: Clip.hardEdge,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTapDown: enabled ? (_) => _animationController.forward() : null,
              onTapCancel: () =>
                  enabled ? _animationController.reverse() : null,
              onTapUp: (_) => enabled ? _animationController.reverse() : null,
              onTap: widget.onTap,
              child: Container(
                alignment: widget.contentAlignment ?? Alignment.center,
                width: widget.isExpanded ?? false ? double.infinity : null,
                padding: widget.padding ??
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: DefaultTextStyle(
                  style: widget.textStyle ??
                      TextStyle(
                        color:
                            isPrimary ? Colors.white : AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum XButtonType { primary, white }
