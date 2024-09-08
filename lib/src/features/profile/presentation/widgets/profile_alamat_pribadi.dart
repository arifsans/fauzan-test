import 'dart:io';

import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/kabupaten/kabupaten_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/kecamatan/kecamatan_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/kelurahan/kelurahan_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/provinsi/provinsi_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/stepper/stepper_bloc.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_button.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_region_dropdown.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_textfield.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_upload_image_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileAlamatPribadi extends StatefulWidget {
  const ProfileAlamatPribadi({
    super.key,
    required this.alamatFKey,
    required this.nikC,
    required this.alamatKtpC,
    required this.kodePosKtpC,
    required this.alamatDomC,
    required this.kodePosDomC,
    required this.provinsiKtpC,
    required this.kabupatenKtpC,
    required this.kecamatanKtpC,
    required this.kelurahanKtpC,
    required this.provinsiDomC,
    required this.kabupatenDomC,
    required this.kecamatanDomC,
    required this.kelurahanDomC,
    required this.onSebelumnya,
    required this.onSelanjutnya,
  });

  final GlobalKey<FormState> alamatFKey;
  final TextEditingController nikC;
  final TextEditingController alamatKtpC;
  final TextEditingController provinsiKtpC;
  final TextEditingController kabupatenKtpC;
  final TextEditingController kecamatanKtpC;
  final TextEditingController kelurahanKtpC;
  final TextEditingController kodePosKtpC;
  final TextEditingController alamatDomC;
  final TextEditingController provinsiDomC;
  final TextEditingController kabupatenDomC;
  final TextEditingController kecamatanDomC;
  final TextEditingController kelurahanDomC;
  final TextEditingController kodePosDomC;
  final Function() onSebelumnya;
  final Function() onSelanjutnya;

  @override
  State<ProfileAlamatPribadi> createState() => _ProfileAlamatPribadiState();
}

class _ProfileAlamatPribadiState extends State<ProfileAlamatPribadi> {
  PlatformFile? fotoKtp;
  final fileTooBigSnackbar = const SnackBar(
    content: Text("File yang kamu pilih melebihi 4MB"),
  );

  bool isAddressSame = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepperBloc, StepperState>(
      builder: (context, state) => state.map(
        loaded: (curStep) {
          return Expanded(
            child: Form(
              key: widget.alamatFKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  uploadPhotoSection(fotoKtp, 'Upload KTP', (file) {
                    setState(() {
                      fotoKtp = file;
                    });
                  }),
                  const SizedBox(height: 8),
                  XTextField(
                    controller: widget.nikC,
                    label: "NIK",
                    hint: "Masukkan NIK",
                    required: true,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 8),
                  XTextField(
                    controller: widget.alamatKtpC,
                    label: "ALAMAT SESUAI KTP",
                    hint: "Masukkan Alamat Sesuai Ktp",
                    required: true,
                  ),
                  const SizedBox(height: 8),
                  RegionDropdowns(
                    provinsiController: widget.provinsiKtpC,
                    kabupatenController: widget.kabupatenKtpC,
                    kecamatanController: widget.kecamatanKtpC,
                    kelurahanController: widget.kelurahanKtpC,
                    provinsiBloc: context.read<ProvinsiBloc>(),
                    kabupatenBloc: context.read<KabupatenBloc>(),
                    kecamatanBloc: context.read<KecamatanBloc>(),
                    kelurahanBloc: context.read<KelurahanBloc>(),
                  ),
                  const SizedBox(height: 8),
                  XTextField(
                    controller: widget.kodePosKtpC,
                    label: "KODE POS",
                    hint: "Masukkan Kode Pos",
                    required: true,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: isAddressSame,
                          activeColor: AppColors.primaryColor,
                          checkColor: Colors.white,
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                isAddressSame = val;
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Alamat domisili sama dengan alamat KTP',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Builder(
                    builder: (context) {
                      if (isAddressSame) {
                        return Container();
                      } else {
                        context.read<ProvinsiBloc>().add(
                              const ProvinsiEvent.get(),
                            );
                        return Column(
                          children: [
                            XTextField(
                              controller: widget.alamatDomC,
                              label: "ALAMAT DOMISILI",
                              hint: "Masukkan Alamat Domisili",
                              required: true,
                            ),
                            const SizedBox(height: 8),
                            RegionDropdowns(
                              provinsiController: widget.provinsiDomC,
                              kabupatenController: widget.kabupatenDomC,
                              kecamatanController: widget.kecamatanDomC,
                              kelurahanController: widget.kelurahanDomC,
                              provinsiBloc: context.read<ProvinsiBloc>(),
                              kabupatenBloc: context.read<KabupatenBloc>(),
                              kecamatanBloc: context.read<KecamatanBloc>(),
                              kelurahanBloc: context.read<KelurahanBloc>(),
                            ),
                            const SizedBox(height: 8),
                            XTextField(
                              controller: widget.kodePosDomC,
                              label: "KODE POS",
                              hint: "Masukkan Kode Pos",
                              keyboardType: TextInputType.number,
                              required: true,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: XButton(
                          type: XButtonType.white,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          onTap: widget.onSebelumnya,
                          child: const Text('Sebelumnya'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: XButton(
                          onTap: widget.onSelanjutnya,
                          child: const Text('Selanjutnya'),
                        ),
                      ),
                    ],
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

  Widget uploadPhotoSection(
    PlatformFile? state,
    String label,
    void Function(PlatformFile file) setState, {
    FileType? fileType,
    List<String>? extensions,
  }) {
    return FormField(
      validator: (_) {
        if (state == null) {
          return "Mohon lampirkan ${label.toLowerCase()}";
        }

        return null;
      },
      builder: (formState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state != null && fileType == null)
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.file(
                      File(state.path!),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            XUploadImageButton(
                label: label,
                fileType: fileType ?? FileType.image,
                allowedExtensions: extensions,
                onFilePicked: (picker) async {
                  final file = picker.files.first;

                  if (file.size >= 4.096e+6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      fileTooBigSnackbar,
                    );
                    return;
                  }

                  setState(file);
                }),
            if (formState.hasError)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    formState.errorText!,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              )
          ],
        );
      },
    );
  }
}
