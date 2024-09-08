import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/input_label.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_shimmer.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_textfield.dart';
import 'package:flutter/material.dart';

class XDropdown<T> extends StatefulWidget {
  const XDropdown({
    super.key,
    this.hint,
    this.label,
    this.items = const [],
    this.onChanged,
    this.initialValue,
    this.canRetractValue,
    this.enabled,
    this.enableSearch,
    this.enableMultiSelection,
    this.onMultipleValuesChanged,
    this.initialValues,
    this.validator,
    this.required,
    this.future,
  });

  final String? hint, label;
  final List<CustomDropdownMenuItem<T>> items;
  final Future<List<CustomDropdownMenuItem<T>>>? future;
  final void Function(T? value)? onChanged;
  final String? Function(T? value)? validator;
  final void Function(List<T?> value)? onMultipleValuesChanged;
  final T? initialValue;
  final List<T?>? initialValues;
  final bool? canRetractValue,
      enabled,
      enableSearch,
      enableMultiSelection,
      required;

  @override
  State<XDropdown<T>> createState() => XDropdownState<T>();
}

class XDropdownState<T> extends State<XDropdown<T>> {
  CustomDropdownMenuItem<T>? _value;
  bool _futureCompleted = false;
  late bool _enableMultiSelection, _enableSearch;
  late List<CustomDropdownMenuItem<T>> _values, _items;

  T? get value => _value?.value;

  List<T?> get values => _values.map((e) => e.value).toList();

  set value(T? value) => setState(() {
        _value = findItem(value);
      });

  CustomDropdownMenuItem<T>? findItem(T? value) {
    if (value == null) return null;

    try {
      return _items.where((element) => element.value == value).first;
    } catch (e) {
      debugPrint("Dropdown Exception: no item, $e, $value");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _enableMultiSelection = widget.enableMultiSelection ?? false;
    _enableSearch = widget.enableSearch ?? false;
    _items = widget.items;

    _initiateInitialValues();
  }

  void _initiateInitialValues() {
    _value = findItem(widget.initialValue);
    _values = widget.initialValues
            ?.map((e) => findItem(e))
            .where((element) => element != null)
            .cast<CustomDropdownMenuItem<T>>()
            .toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.future != null && !_futureCompleted) {
      widget.future!.then((value) => setState(() {
            _futureCompleted = true;
            _items = value;

            _initiateInitialValues();
          }));

      return const XShimmer(width: double.infinity, height: 50);
    }

    return FormField<T>(
      validator: (_) {
        if ((widget.required ?? false) &&
            (_value == null ||
                ((widget.enableMultiSelection ?? false) && _values.isEmpty))) {
          return "Kolom ini wajib diisi";
        }

        if (widget.validator != null) return widget.validator!(_value?.value);

        return null;
      },
      builder: (state) {
        return InputLabel(
          label: widget.label,
          errorText: state.errorText,
          required: widget.required ?? false,
          child: IgnorePointer(
            ignoring: !(widget.enabled ?? true),
            child: Container(
              decoration: BoxDecoration(
                color: widget.enabled ?? true
                    ? null
                    : const Color(
                        0xFFF5F5F5,
                      ),
                border: Border.all(
                  color: state.hasError
                      ? Colors.red
                      : const Color(
                          0xFFC3C3C3,
                        ),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(15),
              child: Builder(
                builder: (context) {
                  final items = [
                    CustomDropdownMenuItem<T>(
                      enabled:
                          value == null || (widget.canRetractValue ?? false),
                      child: Text(
                        widget.hint ?? "Pilih",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ..._items
                  ];

                  if (_enableMultiSelection || _enableSearch) {
                    Widget label = Text(
                      widget.hint ?? "Pilih",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    );

                    if (_enableMultiSelection && _values.isNotEmpty) {
                      label = Row(
                        children: _values
                            .map(
                              (e) => Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDDDDDD),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: e.child,
                                  ),
                                  const SizedBox(width: 5),
                                ],
                              ),
                            )
                            .toList(),
                      );
                    } else if (_value != null) {
                      label = _value!.child;
                    }

                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: DropdownBottomSheet<T>(
                              items: items,
                              label: widget.label,
                              onChanged: widget.onChanged,
                              onMultipleValuesChanged:
                                  widget.onMultipleValuesChanged,
                              parentState: this,
                            ),
                          ),
                        ).then(
                          (value) => setState(() {}),
                        );
                      },
                      child: DefaultTextStyle(
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        child: Row(
                          children: [
                            Expanded(child: label),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFF616161),
                            )
                          ],
                        ),
                      ),
                    );
                  }

                  return DropdownButtonHideUnderline(
                    child: DropdownButton<T>(
                      isExpanded: true,
                      items: items,
                      value: value,
                      isDense: true,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF616161),
                      ),
                      onChanged: (T? val) {
                        value = val;

                        if (widget.onChanged != null) widget.onChanged!(val);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class DropdownBottomSheet<T> extends StatefulWidget {
  const DropdownBottomSheet(
      {super.key,
      required this.items,
      this.label,
      required this.parentState,
      this.onMultipleValuesChanged,
      this.onChanged});

  final List<CustomDropdownMenuItem<T>> items;
  final String? label;
  final XDropdownState parentState;
  final void Function(List<T?> value)? onMultipleValuesChanged;
  final void Function(T? value)? onChanged;

  @override
  State<DropdownBottomSheet<T>> createState() => _DropdownBottomSheetState<T>();
}

class _DropdownBottomSheetState<T> extends State<DropdownBottomSheet<T>> {
  String query = '';
  final List<CustomDropdownMenuItem<T>> _items = [];
  final padding = 16.0;

  @override
  Widget build(BuildContext context) {
    const primaryColor = AppColors.primaryColor;

    if (widget.parentState._enableSearch) {
      _items.clear();

      for (final item in widget.items) {
        if (query.isEmpty ||
            (item.identifier?.toLowerCase().contains(query.toLowerCase()) ??
                true)) {
          _items.add(item);
        }
      }
    } else if (_items.isEmpty) {
      _items.addAll(widget.items);
    }

    return Padding(
      padding: EdgeInsets.only(
        top: padding + 10,
        left: padding,
        right: padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label ?? "Pilih",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (widget.parentState._enableSearch)
            Column(
              children: [
                const SizedBox(height: 20),
                XTextField(
                  hint: "Cari",
                  autofocus: true,
                  onChanged: (val) {
                    setState(
                      () {
                        query = val!;
                      },
                    );
                  },
                )
              ],
            ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: _items.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = _items[index];
                final isSelected = _items
                    .where(
                      (e) => widget.parentState._enableMultiSelection
                          ? widget.parentState.values.contains(item.value)
                          : e == item.value,
                    )
                    .isNotEmpty;

                return Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? primaryColor.withOpacity(.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: item.value == null
                          ? null
                          : () {
                              if (widget.parentState._enableMultiSelection) {
                                if (isSelected) {
                                  widget.parentState._values.remove(item);
                                } else {
                                  widget.parentState._values.add(item);
                                }

                                if (widget.parentState.widget
                                        .onMultipleValuesChanged !=
                                    null) {
                                  widget.parentState.widget
                                          .onMultipleValuesChanged!(
                                      widget.parentState.values);
                                }

                                return setState(() {});
                              }

                              if (widget.onChanged != null) {
                                widget.onChanged!(item.value);
                              }

                              widget.parentState._value = item;
                              Navigator.pop(context);
                            },
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          child: item.child,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomDropdownMenuItem<T> extends DropdownMenuItem<T> {
  const CustomDropdownMenuItem({
    super.key,
    required super.child,
    super.value,
    super.enabled,
    this.identifier,
  });

  final String? identifier;
}

typedef DropdownController<T> = GlobalKey<XDropdownState<T>>;
