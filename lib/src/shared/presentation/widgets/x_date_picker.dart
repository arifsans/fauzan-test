import 'package:fauzan_test/src/shared/presentation/widgets/input_label.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class XDatePicker extends StatefulWidget {
  const XDatePicker({
    super.key,
    this.hint,
    this.label,
    this.initialDate,
    this.lastDate,
    this.firstDate,
    this.enabled,
    this.required,
    this.validator,
    this.onChanged,
  });

  final String? hint, label;
  final bool? enabled, required;
  final String? Function(DateTime? date)? validator;
  final void Function(DateTime date)? onChanged;
  final DateTime? initialDate, lastDate, firstDate;

  @override
  State<XDatePicker> createState() => XDatePickerState();
}

class XDatePickerState extends State<XDatePicker> {
  DateTime? _date;

  DateTime? get date => _date;

  set date(DateTime? date) {
    setState(() {
      _date = date;
    });
  }

  @override
  void initState() {
    super.initState();

    _date = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (_) {
        if ((widget.required ?? false) && _date == null) {
          return "Kolom ini wajib diisi";
        }

        if (widget.validator != null) widget.validator!(_date);

        return null;
      },
      builder: (state) {
        return InputLabel(
          required: widget.required ?? false,
          label: widget.label,
          errorText: state.errorText,
          child: XButton(
            onTap: widget.enabled ?? true
                ? () async {
                    final firstDate = widget.firstDate ??
                        DateTime.fromMillisecondsSinceEpoch(0);

                    final picker = await showDatePicker(
                      context: context,
                      initialDate: _date == null ||
                              _date!.millisecondsSinceEpoch <
                                  firstDate.millisecondsSinceEpoch
                          ? DateTime.now()
                          : _date!,
                      firstDate: firstDate,
                      lastDate: widget.lastDate ?? DateTime.now(),
                    );

                    if (picker == null) return;

                    date = picker;

                    if (widget.onChanged != null) widget.onChanged!(date!);
                  }
                : null,
            contentAlignment: Alignment.centerLeft,
            isExpanded: true,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.enabled ?? true
                  ? null
                  : const Color(
                      0xFFC3C3C3,
                    ),
              border: Border.all(
                width: 1,
                color: state.hasError
                    ? Colors.red
                    : const Color(
                        0xFFC3C3C3,
                      ),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              date == null
                  ? (widget.hint) ?? "Pilih tanggal"
                  : DateFormat('dd MMMM yyyy').format(date!),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: date == null ? Colors.grey : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
