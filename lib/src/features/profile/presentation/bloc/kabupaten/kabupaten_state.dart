part of 'kabupaten_bloc.dart';

@freezed
class KabupatenState with _$KabupatenState {
  const factory KabupatenState.initial() = _Initial;
  const factory KabupatenState.loading() = _Loading;
  const factory KabupatenState.error({required String message}) = _Error;
  const factory KabupatenState.loaded({required List<RegionModel> lKabupaten}) =
      _Loaded;
}
