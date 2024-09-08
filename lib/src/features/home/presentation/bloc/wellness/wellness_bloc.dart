import 'package:fauzan_test/src/core/helper/helper.dart';
import 'package:fauzan_test/src/shared/data/data_sources/local/wellness_database.dart';
import 'package:fauzan_test/src/shared/domain/models/wellness.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'wellness_state.dart';
part 'wellness_event.dart';
part 'wellness_bloc.freezed.dart';

class WellnessBloc extends Bloc<WellnessEvent, WellnessState> {
  final WellnessDatabase database = GetIt.I<WellnessDatabase>();

  WellnessBloc() : super(const WellnessState.initial()) {
    on<WellnessEvent>(
      (event, emit) async {
        await event.map(
          checkAndInsertInitialData: (param) async {
            await _onCheckAndInsertInitialData(event, emit);
          },
          getWellnessData: (param) async {
            await _onGetWellnessData(
              param.sort,
              emit,
            );
          },
        );
      },
    );
  }

  ///Check wellness database and insert data if database is empty
  Future<void> _onCheckAndInsertInitialData(
    WellnessEvent event,
    Emitter<WellnessState> emit,
  ) async {
    emit(const WellnessState.loading());
    try {
      final dao = database.wellnessDAO;
      var wellnessList = await dao.getWellness();

      if (wellnessList.isEmpty) {
        final List<Wellness> initialData = [
          Wellness(
            gambar: Helper.getImagePath('img_indomaret.png'),
            harga: 25000,
            judul: 'Voucher Digital Indomaret Rp 25.000',
            tipe: 'Voucher Digital',
            urlShare: '',
            deskripsi:
                'Voucher Indomaret Digital Code adalah Voucher Belanja non fisik yang terdiri dari 16 digit kode Voucher. Voucher Belanja Indomaret Digital ini dapet digunakan untuk transaksi apa saja.',
            minQty: 1,
            maxQty: 5,
          ),
          Wellness(
            gambar: Helper.getImagePath('img_grab.png'),
            harga: 20000,
            judul: 'Voucher Digital Grab Transport Rp 20.000',
            tipe: 'Voucher Digital',
            urlShare: '',
            deskripsi:
                'Voucher Grab Digital Code adalah Voucher Belanja non fisik yang terdiri dari 12 digit kode Voucher. Voucher Belanja Grab Digital ini dapet digunakan untuk transaksi layanan Grab.',
            minQty: 1,
            maxQty: 5,
          ),
          Wellness(
            gambar: Helper.getImagePath('img_excelso.png'),
            harga: 50000,
            judul: 'Voucher Digital Excelso Rp 50.000',
            tipe: 'Voucher Digital',
            urlShare: '',
            deskripsi:
                'Voucher Excelso Digital Code adalah Voucher Belanja non fisik yang terdiri dari 14 digit kode Voucher. Voucher Belanja Excelso Digital ini dapet digunakan untuk transaksi di Outlet Excelso.',
            minQty: 1,
            maxQty: 5,
          ),
          Wellness(
            gambar: Helper.getImagePath('img_indomaret.png'),
            harga: 50000,
            judul: 'Voucher Digital Indomaret Rp 50.000',
            tipe: 'Voucher Digital',
            urlShare: '',
            deskripsi:
                'Voucher Indomaret Digital Code adalah Voucher Belanja non fisik yang terdiri dari 16 digit kode Voucher. Voucher Belanja Indomaret Digital ini dapet digunakan untuk transaksi apa saja.',
            minQty: 1,
            maxQty: 5,
          ),
          Wellness(
            gambar: Helper.getImagePath('img_hnm.png'),
            harga: 100000,
            judul: 'Voucher Digital H&M Rp 100.000',
            tipe: 'Voucher Digital',
            urlShare: '',
            deskripsi:
                'Voucher H&M Digital Code adalah Voucher Belanja non fisik yang terdiri dari 14 digit kode Voucher. Voucher Belanja H&M Digital ini dapet digunakan untuk transaksi di Outlet H&M.',
            minQty: 1,
            maxQty: 5,
          ),
          Wellness(
            gambar: Helper.getImagePath('img_bakmi_gm.png'),
            harga: 100000,
            judul: 'Voucher Digital Bakmi GM Rp 100.000',
            tipe: 'Voucher Digital',
            urlShare: '',
            deskripsi:
                'Voucher Bakmi GM Digital Code adalah Voucher Belanja non fisik yang terdiri dari 14 digit kode Voucher. Voucher Belanja Bakmi GM Digital ini dapet digunakan untuk transaksi di Outlet Bakmi GM.',
            minQty: 1,
            maxQty: 5,
          ),
        ];

        await dao.insertWellness(initialData).then((value) async {
          wellnessList = await dao.getWellness();

          emit(const WellnessState.loaded());
        });
      } else {
        emit(const WellnessState.loaded());
      }
    } catch (e) {
      emit(WellnessState.error(message: 'Failed to insert initial data: $e'));
    }
  }

  ///Get wellness data from database
  Future<void> _onGetWellnessData(
    WellnessSorting? sort,
    Emitter<WellnessState> emit,
  ) async {
    emit(const WellnessState.loading());

    if ((sort ?? WellnessSorting.normal) == WellnessSorting.normal) {
      try {
        final dao = database.wellnessDAO;
        final wellnessList = await dao.getWellness();

        emit(WellnessState.dataLoaded(
          wellnessData: wellnessList,
        ));
      } catch (e) {
        emit(WellnessState.error(message: 'Failed to get data: $e'));
      }
    }

    if ((sort ?? WellnessSorting.normal) == WellnessSorting.termurah) {
      try {
        final dao = database.wellnessDAO;
        final wellnessList = await dao.getWellnessByHargaTermurah();

        emit(WellnessState.dataLoaded(
          wellnessData: wellnessList,
        ));
      } catch (e) {
        emit(WellnessState.error(message: 'Failed to get data: $e'));
      }
    }

    if ((sort ?? WellnessSorting.normal) == WellnessSorting.termahal) {
      try {
        final dao = database.wellnessDAO;
        final wellnessList = await dao.getWellnessByHargaTermahal();

        emit(WellnessState.dataLoaded(
          wellnessData: wellnessList,
        ));
      } catch (e) {
        emit(WellnessState.error(message: 'Failed to get data: $e'));
      }
    }
  }
}
