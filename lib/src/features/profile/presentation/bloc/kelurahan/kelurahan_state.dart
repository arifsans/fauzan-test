part of 'kelurahan_bloc.dart';

@freezed
class KelurahanState with _$KelurahanState {
  const factory KelurahanState.initial() = _Initial;
  const factory KelurahanState.loading() = _Loading;
  const factory KelurahanState.error({required String message}) = _Error;
  const factory KelurahanState.loaded({required List<RegionModel> lKelurahan}) =
      _Loaded;
}
