import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    super.key,
    required this.child,
    this.label,
    this.required = false,
    this.errorText,
  });

  final Widget child;
  final bool required;
  final String? label, errorText;

  @override
  Widget build(BuildContext context) {
    Widget input = child;
    final errorTextWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            errorText ?? "",
            style: const TextStyle(fontSize: 12, color: Colors.red),
          ),
        ),
      ],
    );

    if (label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              children: [
                if (required)
                  const TextSpan(
                    text: "* ",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                TextSpan(text: label!),
              ],
            ),
          ),
          const SizedBox(height: 8),
          child,
          if (errorText != null) errorTextWidget
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [input, if (errorText != null) errorTextWidget],
    );
  }
}
