import 'package:fauzan_test/src/shared/presentation/widgets/input_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XTextField extends StatelessWidget {
  const XTextField({
    super.key,
    this.padding,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.formatters,
    this.controller,
    this.validator,
    this.maxLines,
    this.enabled,
    this.required,
    this.autofocus,
    this.onChanged,
  });

  final String? label, hint;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? formatters;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChanged;
  final int? maxLines;
  final bool? enabled, required, autofocus;

  @override
  Widget build(BuildContext context) {
    return InputLabel(
      label: label,
      required: required ?? false,
      child: TextFormField(
        enabled: enabled,
        onChanged: onChanged,
        autofocus: autofocus ?? false,
        validator: required ?? false
            ? (val) {
                if (val!.isEmpty) return "Kolom ini wajib diisi";

                if (validator != null) return validator!(val);

                return null;
              }
            : validator,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        inputFormatters: formatters,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          alignLabelWithHint: false,
          hintText: hint,
          fillColor: enabled ?? true
              ? Colors.transparent
              : const Color(
                  0xFFF5F5F5,
                ),
          filled: true,
          enabledBorder: border(),
          disabledBorder: border(),
          errorBorder: border(color: Colors.red),
          focusedErrorBorder: border(color: Colors.red),
          errorMaxLines: 2,
          focusedBorder: border(color: Theme.of(context).colorScheme.primary),
          contentPadding: padding ?? const EdgeInsets.all(16),
          isDense: true,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  InputBorder border({Color? color}) => OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: color ?? const Color(0xFFC3C3C3),
        ),
      );
}
