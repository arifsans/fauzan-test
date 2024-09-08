import 'package:dropdown_search/dropdown_search.dart';
import 'package:fauzan_test/src/features/profile/domain/models/region_model.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/kabupaten/kabupaten_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/kecamatan/kecamatan_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/kelurahan/kelurahan_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/provinsi/provinsi_bloc.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/input_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionDropdowns extends StatefulWidget {
  const RegionDropdowns({
    super.key,
    this.provinsiController,
    this.kabupatenController,
    this.kecamatanController,
    this.kelurahanController,
    required this.provinsiBloc,
    required this.kabupatenBloc,
    required this.kecamatanBloc,
    required this.kelurahanBloc,
  });

  final TextEditingController? provinsiController;
  final TextEditingController? kabupatenController;
  final TextEditingController? kecamatanController;
  final TextEditingController? kelurahanController;
  final ProvinsiBloc provinsiBloc;
  final KabupatenBloc kabupatenBloc;
  final KecamatanBloc kecamatanBloc;
  final KelurahanBloc kelurahanBloc;

  @override
  State<RegionDropdowns> createState() => _RegionDropdownsState();
}

class _RegionDropdownsState extends State<RegionDropdowns> {
  late TextEditingController _provController;
  late TextEditingController _kabController;
  late TextEditingController _kecController;
  late TextEditingController _kelController;

  List<RegionModel> provinsi = [];
  List<RegionModel> kota = [];
  List<RegionModel> kecamatan = [];
  List<RegionModel> kelurahan = [];

  RegionModel? provinsiDipilih;
  RegionModel? kotaDipilih;
  RegionModel? kecamatanDipilih;
  RegionModel? kelurahanDipilih;

  @override
  void initState() {
    super.initState();
    _provController = widget.provinsiController ?? TextEditingController();
    _kabController = widget.kabupatenController ?? TextEditingController();
    _kecController = widget.kecamatanController ?? TextEditingController();
    _kelController = widget.kelurahanController ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocListener(
          bloc: widget.provinsiBloc,
          listener: (context, ProvinsiState state) => state.mapOrNull(
            loaded: (val) {
              setState(() {
                provinsi = val.lProvinsi;
              });
              return null;
            },
          ),
          child: FormField(
            validator: (value) {
              if (provinsiDipilih == null) {
                return 'Wajib memilih provinsi';
              }
              return null;
            },
            builder: (state) {
              return InputLabel(
                label: 'PROVINSI',
                required: true,
                errorText: state.errorText,
                child: DropdownSearch<RegionModel>(
                  items: provinsi,
                  selectedItem: provinsiDipilih,
                  itemAsString: (item) => item.nama,
                  onChanged: (value) {
                    if (value != null) {
                      _provController.text = value.nama;
                      provinsiDipilih = value;
                      widget.kabupatenBloc.add(
                        KabupatenEvent.get(idProvinsi: value.id),
                      );
                    }
                  },
                  popupProps: PopupProps.menu(
                    emptyBuilder: (context, searchEntry) {
                      return Center(
                        child: Text(
                          'Provinsi $searchEntry tidak dapat ditemukan',
                        ),
                      );
                    },
                    containerBuilder: (context, popupWidget) {
                      return Card(
                        margin: const EdgeInsets.only(top: 12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: popupWidget,
                      );
                    },
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      style: const TextTheme().bodyMedium,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: 'Cari Provinsi',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    searchDelay: const Duration(milliseconds: 500),
                    menuProps: const MenuProps(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                    itemBuilder: (context, item, isSelected) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          item.nama,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  dropdownBuilder: (context, selectedItem) {
                    return Text(
                      selectedItem?.nama ?? 'Pilih Provinsi',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                  dropdownButtonProps: const DropdownButtonProps(
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 24,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        BlocListener(
          bloc: widget.kabupatenBloc,
          listener: (context, KabupatenState state) => state.mapOrNull(
            loaded: (val) {
              setState(() {
                kota = val.lKabupaten;
              });
              return null;
            },
          ),
          child: FormField(
            validator: (value) {
              if (kotaDipilih == null) {
                return 'Wajib memilih Kabupaten/Kota';
              }
              return null;
            },
            builder: (state) {
              return InputLabel(
                label: 'KOTA/KABUPATEN',
                required: true,
                errorText: state.errorText,
                child: DropdownSearch<RegionModel>(
                  items: kota,
                  selectedItem: kotaDipilih,
                  itemAsString: (item) => item.nama,
                  onChanged: (value) {
                    if (value != null) {
                      _kabController.text = value.nama;
                      kotaDipilih = value;
                      widget.kecamatanBloc.add(
                        KecamatanEvent.get(idKabupaten: value.id),
                      );
                    }
                  },
                  popupProps: PopupProps.menu(
                    emptyBuilder: (context, searchEntry) {
                      return Center(
                        child: Text(
                          'Kota $searchEntry tidak dapat ditemukan',
                        ),
                      );
                    },
                    containerBuilder: (context, popupWidget) {
                      return Card(
                        margin: const EdgeInsets.only(top: 12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: popupWidget,
                      );
                    },
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      style: const TextTheme().bodyMedium,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: 'Cari Kota',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    searchDelay: const Duration(milliseconds: 500),
                    menuProps: const MenuProps(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                    itemBuilder: (context, item, isSelected) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          item.nama,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  dropdownBuilder: (context, selectedItem) {
                    return Text(
                      selectedItem?.nama ?? 'Pilih Kota',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                  dropdownButtonProps: const DropdownButtonProps(
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 24,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        BlocListener(
          bloc: widget.kecamatanBloc,
          listener: (context, KecamatanState state) => state.mapOrNull(
            loaded: (val) {
              setState(() {
                kecamatan = val.lKecamatan;
              });
              return null;
            },
          ),
          child: FormField(
            validator: (value) {
              if (kecamatanDipilih == null) {
                return 'Wajib memilih Kecamatan';
              }
              return null;
            },
            builder: (state) {
              return InputLabel(
                label: 'KECAMATAN',
                required: true,
                errorText: state.errorText,
                child: DropdownSearch<RegionModel>(
                  items: kecamatan,
                  selectedItem: kecamatanDipilih,
                  itemAsString: (item) => item.nama,
                  onChanged: (value) {
                    if (value != null) {
                      _kecController.text = value.nama;
                      kecamatanDipilih = value;
                      widget.kelurahanBloc.add(
                        KelurahanEvent.get(idKecamatan: value.id),
                      );
                    }
                  },
                  popupProps: PopupProps.menu(
                    emptyBuilder: (context, searchEntry) {
                      return Center(
                        child: Text(
                          'Kecamatan $searchEntry tidak dapat ditemukan',
                        ),
                      );
                    },
                    containerBuilder: (context, popupWidget) {
                      return Card(
                        margin: const EdgeInsets.only(top: 12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: popupWidget,
                      );
                    },
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      style: const TextTheme().bodyMedium,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: 'Cari Kecamatan',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    searchDelay: const Duration(milliseconds: 500),
                    menuProps: const MenuProps(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                    itemBuilder: (context, item, isSelected) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          item.nama,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  dropdownBuilder: (context, selectedItem) {
                    return Text(
                      selectedItem?.nama ?? 'Pilih Kecamatan',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                  dropdownButtonProps: const DropdownButtonProps(
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 24,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        BlocListener(
          bloc: widget.kelurahanBloc,
          listener: (context, KelurahanState state) => state.mapOrNull(
            loaded: (val) {
              setState(() {
                kelurahan = val.lKelurahan;
              });
              return null;
            },
          ),
          child: FormField(
            validator: (value) {
              if (kelurahanDipilih == null) {
                return 'Wajib memilih Kelurahan';
              }
              return null;
            },
            builder: (state) {
              return InputLabel(
                label: 'KELURAHAN',
                required: true,
                errorText: state.errorText,
                child: DropdownSearch<RegionModel>(
                  items: kelurahan,
                  selectedItem: kelurahanDipilih,
                  itemAsString: (item) => item.nama,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _kelController.text = value.nama;
                        kelurahanDipilih = value;
                      });
                    }
                  },
                  popupProps: PopupProps.menu(
                    emptyBuilder: (context, searchEntry) {
                      return Center(
                        child: Text(
                          'Kelurahan $searchEntry tidak dapat ditemukan',
                        ),
                      );
                    },
                    containerBuilder: (context, popupWidget) {
                      return Card(
                        margin: const EdgeInsets.only(top: 12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: popupWidget,
                      );
                    },
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      style: const TextTheme().bodyMedium,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintText: 'Cari Kelurahan',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    searchDelay: const Duration(milliseconds: 500),
                    menuProps: const MenuProps(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                    itemBuilder: (context, item, isSelected) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          item.nama,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  dropdownBuilder: (context, selectedItem) {
                    return Text(
                      selectedItem?.nama ?? 'Pilih Kelurahan',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                  dropdownButtonProps: const DropdownButtonProps(
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 24,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
