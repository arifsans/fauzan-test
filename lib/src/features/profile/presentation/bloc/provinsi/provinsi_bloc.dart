import 'package:fauzan_test/src/features/profile/data/repositories/region_repository.dart';
import 'package:fauzan_test/src/features/profile/domain/models/region_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'provinsi_state.dart';
part 'provinsi_event.dart';
part 'provinsi_bloc.freezed.dart';

class ProvinsiBloc extends Bloc<ProvinsiEvent, ProvinsiState> {
  final repo = GetIt.I<RegionRepository>();
  ProvinsiBloc() : super(const ProvinsiState.initial()) {
    on<ProvinsiEvent>(
      (event, emit) async {
        await event.map(
          get: (param) async {
            emit(const ProvinsiState.loading());
            try {
              var data = await repo.getProvinsi();

              if (data.isNotEmpty) {
                emit(ProvinsiState.loaded(lProvinsi: data));
              }
            } catch (e) {
              emit(
                ProvinsiState.error(
                  message: 'Failed to get provinsi data: $e',
                ),
              );
            }
          },
        );
      },
    );
  }
}
