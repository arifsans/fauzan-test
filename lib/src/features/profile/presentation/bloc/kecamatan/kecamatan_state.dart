part of 'kecamatan_bloc.dart';

@freezed
class KecamatanState with _$KecamatanState {
  const factory KecamatanState.initial() = _Initial;
  const factory KecamatanState.loading() = _Loading;
  const factory KecamatanState.error({required String message}) = _Error;
  const factory KecamatanState.loaded({required List<RegionModel> lKecamatan}) =
      _Loaded;
}
