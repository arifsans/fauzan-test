import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/stepper/stepper_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/user/user_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/widgets/profile_alamat_pribadi.dart';
import 'package:fauzan_test/src/features/profile/presentation/widgets/profile_biodata.dart';
import 'package:fauzan_test/src/features/profile/presentation/widgets/profile_informasi_perusahaan.dart';
import 'package:fauzan_test/src/features/profile/presentation/widgets/profile_stepper.dart';
import 'package:fauzan_test/src/shared/domain/models/user.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_date_picker.dart';
import 'package:fauzan_test/src/shared/presentation/widgets/x_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController nameC;
  late TextEditingController mailC;
  late TextEditingController phoneC;
  final GlobalKey<FormState> biodataFKey = GlobalKey<FormState>();
  final GlobalKey<FormState> alamatFKey = GlobalKey<FormState>();
  final GlobalKey<FormState> infoPerusahaanFKey = GlobalKey<FormState>();
  late GlobalKey<XDatePickerState> tanggalLahirKey;
  late final DropdownController<String> jenisKelaminFKey;
  late final DropdownController<String> pendidikanFKey;
  late final DropdownController<String> statusPerkawinanFKey;

  late TextEditingController nikC;
  late TextEditingController alamatKtpC;
  late TextEditingController provinsiKtpC;
  late TextEditingController kabupatenKtpC;
  late TextEditingController kecamatanKtpC;
  late TextEditingController kelurahanKtpC;
  late TextEditingController kodePosKtpC;
  late TextEditingController alamatDomC;
  late TextEditingController provinsiDomC;
  late TextEditingController kabupatenDomC;
  late TextEditingController kecamatanDomC;
  late TextEditingController kelurahanDomC;
  late TextEditingController kodePosDomC;

  late TextEditingController namaUsahaC;
  late TextEditingController alamatUsahaC;
  late TextEditingController cabangBankC;
  late TextEditingController noRekC;
  late TextEditingController namaPemilikRekC;
  late final DropdownController<String> jabatanFKey;
  late final DropdownController<String> lamaBekerjaFKey;
  late final DropdownController<String> sumberPendapatanFKey;
  late final DropdownController<String> pendapatanGrossFKey;
  late final DropdownController<String> namaBankFKey;

  late final User initialUser;
  late final int? idUser;

  @override
  void initState() {
    nameC = TextEditingController();
    mailC = TextEditingController();
    phoneC = TextEditingController();
    tanggalLahirKey = GlobalKey<XDatePickerState>();
    jenisKelaminFKey = DropdownController<String>();
    pendidikanFKey = DropdownController<String>();
    statusPerkawinanFKey = DropdownController<String>();

    nikC = TextEditingController();
    alamatKtpC = TextEditingController();
    provinsiKtpC = TextEditingController();
    kabupatenKtpC = TextEditingController();
    kecamatanKtpC = TextEditingController();
    kelurahanKtpC = TextEditingController();
    kodePosKtpC = TextEditingController();
    alamatDomC = TextEditingController();
    provinsiDomC = TextEditingController();
    kabupatenDomC = TextEditingController();
    kecamatanDomC = TextEditingController();
    kelurahanDomC = TextEditingController();
    kodePosDomC = TextEditingController();

    namaUsahaC = TextEditingController();
    alamatUsahaC = TextEditingController();
    cabangBankC = TextEditingController();
    noRekC = TextEditingController();
    namaPemilikRekC = TextEditingController();
    jabatanFKey = DropdownController<String>();
    lamaBekerjaFKey = DropdownController<String>();
    sumberPendapatanFKey = DropdownController<String>();
    pendapatanGrossFKey = DropdownController<String>();
    namaBankFKey = DropdownController<String>();
    super.initState();
  }

  @override
  void dispose() {
    nameC.dispose();
    mailC.dispose();
    phoneC.dispose();
    nikC.dispose();
    alamatKtpC.dispose();
    provinsiKtpC.dispose();
    kabupatenKtpC.dispose();
    kecamatanKtpC.dispose();
    kelurahanKtpC.dispose();
    kodePosKtpC.dispose();
    alamatDomC.dispose();
    provinsiDomC.dispose();
    kabupatenDomC.dispose();
    kecamatanDomC.dispose();
    kelurahanDomC.dispose();
    kodePosDomC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.chevron_left_outlined,
            size: 32,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Informasi Pribadi',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<StepperBloc, StepperState>(
        builder: (context, state) => state.map(
          loaded: (curStep) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      ProfileStepper(
                        width: double.maxFinite,
                        curStep: curStep.index,
                        stepCompleteColor: AppColors.primaryColor,
                        totalSteps: 3,
                        inactiveColor: AppColors.primaryColor.withOpacity(.3),
                        currentStepColor: AppColors.primaryColor,
                        lineWidth: 2,
                        onStepTapped: (step) {
                          if (curStep.index == 1 && step > curStep.index) {
                            if (!biodataFKey.currentState!.validate()) {
                              return;
                            }
                          }

                          if (curStep.index == 2 && step > curStep.index) {
                            if (!alamatFKey.currentState!.validate()) {
                              return;
                            }
                          }

                          if (curStep.index == 3) {
                            if (!infoPerusahaanFKey.currentState!.validate()) {
                              return;
                            }
                          }

                          context.read<StepperBloc>().add(
                                StepperEvent.updateStep(index: step),
                              );
                        },
                      ),
                      const SizedBox(height: 4),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Biodata diri',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Alamat\nPribadi',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Informasi\nPerusahaan',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                BlocListener<UserBloc, UserState>(
                  listener: (context, state) => state.mapOrNull(
                    loaded: (item) => context.read<UserBloc>().add(
                          const UserEvent.getUserData(),
                        ),
                    successUpdate: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Berhasil update data"),
                      ));
                      return null;
                    },
                    dataLoaded: (item) {
                      setState(() {
                        initialUser = item.userData;
                        idUser = initialUser.id;
                        nameC.text = initialUser.nama;
                        tanggalLahirKey.currentState!.date = DateTime.parse(
                          initialUser.tglLahir,
                        );
                        jenisKelaminFKey.currentState!.value =
                            initialUser.jenisKelamin;
                        mailC.text = initialUser.email;
                        phoneC.text = initialUser.noHp;
                        pendidikanFKey.currentState!.value =
                            initialUser.pendidikan;
                        statusPerkawinanFKey.currentState!.value =
                            initialUser.statusPernikahan;
                      });
                      return null;
                    },
                  ),
                  child: Builder(
                    builder: (context) {
                      switch (curStep.index) {
                        case 1:
                          return ProfileBiodata(
                            biodataFKey: biodataFKey,
                            nameC: nameC,
                            tanggalLahirKey: tanggalLahirKey,
                            jenisKelaminFKey: jenisKelaminFKey,
                            mailC: mailC,
                            phoneC: phoneC,
                            pendidikanFKey: pendidikanFKey,
                            statusPerkawinanFKey: statusPerkawinanFKey,
                            onSelanjutnya: () {
                              if (!biodataFKey.currentState!.validate()) {
                                return;
                              }
                              context.read<UserBloc>().add(
                                    UserEvent.updateUserData(
                                      user: User(
                                        id: idUser,
                                        nama: nameC.text,
                                        tglLahir:
                                            '${tanggalLahirKey.currentState?.date ?? ''}'
                                                    .isNotEmpty
                                                ? DateFormat('yyyy-MM-dd')
                                                    .format(tanggalLahirKey
                                                        .currentState!.date!)
                                                : '1998-09-10',
                                        jenisKelamin: (jenisKelaminFKey
                                                        .currentState?.value ??
                                                    '')
                                                .isNotEmpty
                                            ? jenisKelaminFKey
                                                .currentState!.value!
                                            : 'Laki-laki',
                                        email: mailC.text,
                                        noHp: phoneC.text,
                                        pendidikan:
                                            pendidikanFKey.currentState!.value,
                                        statusPernikahan: statusPerkawinanFKey
                                            .currentState!.value,
                                      ),
                                    ),
                                  );
                              context.read<StepperBloc>().add(
                                    StepperEvent.updateStep(
                                      index: curStep.index + 1,
                                    ),
                                  );
                            },
                          );

                        case 2:
                          return ProfileAlamatPribadi(
                            alamatFKey: alamatFKey,
                            nikC: nikC,
                            alamatKtpC: alamatKtpC,
                            provinsiKtpC: provinsiKtpC,
                            kabupatenKtpC: kabupatenKtpC,
                            kecamatanKtpC: kecamatanKtpC,
                            kelurahanKtpC: kelurahanKtpC,
                            kodePosKtpC: kodePosKtpC,
                            alamatDomC: alamatDomC,
                            provinsiDomC: provinsiDomC,
                            kabupatenDomC: kabupatenDomC,
                            kecamatanDomC: kecamatanDomC,
                            kelurahanDomC: kecamatanDomC,
                            kodePosDomC: kodePosDomC,
                            onSebelumnya: () {
                              context.read<StepperBloc>().add(
                                    StepperEvent.updateStep(
                                      index: curStep.index - 1,
                                    ),
                                  );
                            },
                            onSelanjutnya: () {
                              if (!alamatFKey.currentState!.validate()) {
                                return;
                              }
                              context.read<StepperBloc>().add(
                                    StepperEvent.updateStep(
                                      index: curStep.index + 1,
                                    ),
                                  );
                            },
                          );

                        case 3:
                          return ProfileInformasiPerusahaan(
                            infoPerusahaanFKey: infoPerusahaanFKey,
                            namaUsahaC: namaUsahaC,
                            alamatUsahaC: alamatUsahaC,
                            jabatanFKey: jabatanFKey,
                            lamaBekerjaFKey: lamaBekerjaFKey,
                            sumberPendapatanFKey: sumberPendapatanFKey,
                            pendapatanGrossFKey: pendapatanGrossFKey,
                            namaBankFKey: namaBankFKey,
                            cabangBankC: cabangBankC,
                            noRekC: noRekC,
                            namaPemilikRekC: namaPemilikRekC,
                            onSebelumnya: () {
                              context.read<StepperBloc>().add(
                                    StepperEvent.updateStep(
                                      index: curStep.index - 1,
                                    ),
                                  );
                            },
                            onSelanjutnya: () {
                              if (!infoPerusahaanFKey.currentState!
                                  .validate()) {
                                return;
                              }
                            },
                          );

                        default:
                          return Container();
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
