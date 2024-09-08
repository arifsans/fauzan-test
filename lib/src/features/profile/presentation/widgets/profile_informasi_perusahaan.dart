import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/stepper/stepper_bloc.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_button.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_dropdown.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInformasiPerusahaan extends StatefulWidget {
  const ProfileInformasiPerusahaan({
    super.key,
    required this.infoPerusahaanFKey,
    required this.namaUsahaC,
    required this.alamatUsahaC,
    required this.jabatanFKey,
    required this.lamaBekerjaFKey,
    required this.sumberPendapatanFKey,
    required this.pendapatanGrossFKey,
    required this.namaBankFKey,
    required this.cabangBankC,
    required this.noRekC,
    required this.namaPemilikRekC,
    required this.onSebelumnya,
    required this.onSelanjutnya,
  });

  final GlobalKey<FormState> infoPerusahaanFKey;
  final TextEditingController namaUsahaC;
  final TextEditingController alamatUsahaC;
  final DropdownController<String> jabatanFKey;
  final DropdownController<String> lamaBekerjaFKey;
  final DropdownController<String> sumberPendapatanFKey;
  final DropdownController<String> pendapatanGrossFKey;
  final DropdownController<String> namaBankFKey;
  final TextEditingController cabangBankC;
  final TextEditingController noRekC;
  final TextEditingController namaPemilikRekC;
  final Function() onSebelumnya;
  final Function() onSelanjutnya;

  @override
  State<ProfileInformasiPerusahaan> createState() =>
      _ProfileInformasiPerusahaanState();
}

class _ProfileInformasiPerusahaanState
    extends State<ProfileInformasiPerusahaan> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepperBloc, StepperState>(
      builder: (context, state) => state.map(
        loaded: (curStep) {
          return Expanded(
            child: Form(
              key: widget.infoPerusahaanFKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  XTextField(
                    controller: widget.namaUsahaC,
                    label: "NAMA USAHA / PERUSAHAAN",
                    hint: "Masukkan Nama Usaha / Perusahaan",
                  ),
                  const SizedBox(height: 8),
                  XTextField(
                    controller: widget.alamatUsahaC,
                    label: "ALAMAT USAHA / PERUSAHAAN",
                    hint: "Masukkan Alamat Usaha / Perusahaan",
                  ),
                  const SizedBox(height: 8),
                  XDropdown<String>(
                    key: widget.jabatanFKey,
                    label: "JABATAN",
                    items: [
                      "Non-Staf",
                      "Staf",
                      "Supervisor",
                      "Manajer",
                      "Direktur",
                      "Lainnya"
                    ]
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
                    key: widget.lamaBekerjaFKey,
                    label: "LAMA BEKERJA",
                    items: [
                      "< 6 Bulan",
                      "6 Bulan - 1 Tahun",
                      "1 - 2 Tahun",
                      "> 2 Tahun",
                    ]
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
                    key: widget.sumberPendapatanFKey,
                    label: "SUMBER PENDAPATAN",
                    items: [
                      "Gaji",
                      "Keuntungan Bisnis",
                      "Bunga Tabungan",
                      "Warisan",
                      "Dana dari orang tua atau anak",
                      "Undian",
                      "Keuntungan Investasi",
                      "Lainnya",
                    ]
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
                    key: widget.pendapatanGrossFKey,
                    label: "PENDAPATAN KOTOR PERTAHUN",
                    items: [
                      "< 10 Juta",
                      "10 - 50 Juta",
                      "50 - 100 Juta",
                      "100 - 500 Juta",
                      "500 Juta - 1 Milyar",
                      "> 1 Milyar",
                    ]
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
                    key: widget.namaBankFKey,
                    label: "NAMA BANK",
                    items: [
                      "BANK BCA",
                      "BANK BNI",
                      "BANK BRI",
                      "BANK BSI",
                      "BANK BUKOPIN",
                      "BANK CIMB NIAGA",
                      "BANK DKI",
                      "BANK MANDIRI",
                      "BANK OCBC",
                    ]
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
                    controller: widget.cabangBankC,
                    label: "CABANG BANK",
                    hint: "Masukkan Cabang Bank",
                  ),
                  const SizedBox(height: 8),
                  XTextField(
                    controller: widget.noRekC,
                    label: "NOMOR REKENING",
                    hint: "Masukkan Nomor Rekening",
                  ),
                  const SizedBox(height: 8),
                  XTextField(
                    controller: widget.namaPemilikRekC,
                    label: "NAMA PEMILIK REKENING",
                    hint: "Masukkan Nama Pemilik Rekening",
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
                          child: const Text('Simpan'),
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
}
