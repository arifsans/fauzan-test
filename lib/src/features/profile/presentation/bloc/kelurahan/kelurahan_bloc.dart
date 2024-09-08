import 'package:fauzan_test/src/features/profile/data/repositories/region_repository.dart';
import 'package:fauzan_test/src/features/profile/domain/models/region_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'kelurahan_state.dart';
part 'kelurahan_event.dart';
part 'kelurahan_bloc.freezed.dart';

class KelurahanBloc extends Bloc<KelurahanEvent, KelurahanState> {
  final repo = GetIt.I<RegionRepository>();
  KelurahanBloc() : super(const KelurahanState.initial()) {
    on<KelurahanEvent>(
      (event, emit) async {
        await event.map(
          get: (param) async {
            emit(const KelurahanState.loading());
            try {
              var data = await repo.getKelurahan(
                idKecamatan: param.idKecamatan,
              );
              if (data.isNotEmpty) {
                emit(KelurahanState.loaded(lKelurahan: data));
              }
            } catch (e) {
              emit(
                KelurahanState.error(
                  message: 'Failed to get kelurahan data: $e',
                ),
              );
            }
          },
        );
      },
    );
  }
}
