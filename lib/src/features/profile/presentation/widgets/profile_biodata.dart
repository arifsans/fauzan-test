import 'package:fauzan_test/src/features/profile/presentation/bloc/stepper/stepper_bloc.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_button.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_date_picker.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_dropdown.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBiodata extends StatefulWidget {
  const ProfileBiodata({
    super.key,
    required this.biodataFKey,
    required this.nameC,
    required this.tanggalLahirKey,
    required this.jenisKelaminFKey,
    required this.mailC,
    required this.phoneC,
    required this.pendidikanFKey,
    required this.statusPerkawinanFKey,
    required this.onSelanjutnya,
  });

  final GlobalKey<FormState> biodataFKey;
  final TextEditingController nameC;
  final GlobalKey<XDatePickerState> tanggalLahirKey;
  final DropdownController<String> jenisKelaminFKey;
  final TextEditingController mailC;
  final TextEditingController phoneC;
  final DropdownController<String> pendidikanFKey;
  final DropdownController<String> statusPerkawinanFKey;
  final Function() onSelanjutnya;

  @override
  State<ProfileBiodata> createState() => _ProfileBiodataState();
}

class _ProfileBiodataState extends State<ProfileBiodata> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepperBloc, StepperState>(
      builder: (context, state) => state.map(
        loaded: (curStep) {
          return Expanded(
            child: Form(
              key: widget.biodataFKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  XTextField(
                    controller: widget.nameC,
                    label: "NAMA LENGKAP",
                    hint: "Masukkan Nama Lengkap",
                    required: true,
                  ),
                  const SizedBox(height: 8),
                  XDatePicker(
                    key: widget.tanggalLahirKey,
                    label: "TANGGAL LAHIR",
                    required: true,
                  ),
                  const SizedBox(height: 8),
                  XDropdown<String>(
                    key: widget.jenisKelaminFKey,
                    label: "JENIS KELAMIN",
                    required: true,
                    items: ["Laki-laki", "Perempuan"]
                        .map(
                          (e) => CustomDropdownMenuItem<String>(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  XTextField(
                    controller: widget.mailC,
                    label: "ALAMAT EMAIL",
                    hint: "Masukkan Alamat Email",
                    enabled: false,
                    required: true,
                  ),
                  const SizedBox(height: 8),
                  XTextField(
                    controller: widget.phoneC,
                    label: "NO. HP",
                    hint: "Masukkan No HP",
                    required: true,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 8),
                  XDropdown<String>(
                    key: widget.pendidikanFKey,
                    label: "PENDIDIKAN",
                    items:
                        ["SD", "SMP", "SMA", "D1", "D2", "D3", "S1", "S2", "S3"]
                            .map(
                              (e) => CustomDropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                  const SizedBox(height: 8),
                  XDropdown<String>(
                    key: widget.statusPerkawinanFKey,
                    label: "STATUS PERNIKAHAN",
                    items: ["Belum Kawin", "Kawin", "Janda", "Duda"]
                        .map(
                          (e) => CustomDropdownMenuItem<String>(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  XButton(
                    onTap: widget.onSelanjutnya,
                    child: const Text('Selanjutnya'),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
