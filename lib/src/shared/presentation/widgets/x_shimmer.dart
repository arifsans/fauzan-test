import 'package:flutter/material.dart';

class XShimmer extends StatefulWidget {
  const XShimmer({
    super.key,
    this.width,
    this.height,
    this.onProgress,
    this.child,
  });

  final double? width, height;
  final bool? onProgress;
  final Widget? child;

  @override
  State<XShimmer> createState() => _XShimmerState();
}

class _XShimmerState extends State<XShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {});
      })
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final beginAnimation =
        Tween<double>(begin: -4, end: 3).animate(_controller);
    final endAnimation = Tween<double>(begin: -1, end: 6).animate(_controller);

    if (widget.onProgress != null &&
        widget.child != null &&
        !widget.onProgress!) {
      _controller.stop(canceled: true);

      return widget.child!;
    }

    return Container(
      width: widget.width ?? 300,
      height: widget.height ?? 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: Alignment(beginAnimation.value, 0),
            end: Alignment(endAnimation.value, 0),
            colors: const [
              Color(0xffdddddd),
              Color(0xfff5f5f5),
              Color(0xffdddddd)
            ],
          )),
    );
  }
}
