import 'package:fauzan_test/src/features/profile/data/repositories/region_repository.dart';
import 'package:fauzan_test/src/features/profile/domain/models/region_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'kabupaten_state.dart';
part 'kabupaten_event.dart';
part 'kabupaten_bloc.freezed.dart';

class KabupatenBloc extends Bloc<KabupatenEvent, KabupatenState> {
  final repo = GetIt.I<RegionRepository>();
  KabupatenBloc() : super(const KabupatenState.initial()) {
    on<KabupatenEvent>(
      (event, emit) async {
        await event.map(
          get: (param) async {
            emit(const KabupatenState.loading());
            try {
              var data = await repo.getKabupaten(
                idProvinsi: param.idProvinsi,
              );
              if (data.isNotEmpty) {
                emit(KabupatenState.loaded(lKabupaten: data));
              }
            } catch (e) {
              emit(
                KabupatenState.error(
                  message: 'Failed to get kabupaten data: $e',
                ),
              );
            }
          },
        );
      },
    );
  }
}
