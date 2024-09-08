import 'package:fauzan_test/src/features/profile/data/repositories/region_repository.dart';
import 'package:fauzan_test/src/features/profile/domain/models/region_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'kecamatan_state.dart';
part 'kecamatan_event.dart';
part 'kecamatan_bloc.freezed.dart';

class KecamatanBloc extends Bloc<KecamatanEvent, KecamatanState> {
  final repo = GetIt.I<RegionRepository>();
  KecamatanBloc() : super(const KecamatanState.initial()) {
    on<KecamatanEvent>(
      (event, emit) async {
        await event.map(
          get: (param) async {
            emit(const KecamatanState.loading());
            try {
              var data = await repo.getKecamatan(
                idKabupaten: param.idKabupaten,
              );
              if (data.isNotEmpty) {
                emit(KecamatanState.loaded(lKecamatan: data));
              }
            } catch (e) {
              emit(
                KecamatanState.error(
                  message: 'Failed to get kecamatan data: $e',
                ),
              );
            }
          },
        );
      },
    );
  }
}
