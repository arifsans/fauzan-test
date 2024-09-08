part of 'provinsi_bloc.dart';

@freezed
class ProvinsiState with _$ProvinsiState {
  const factory ProvinsiState.initial() = _Initial;
  const factory ProvinsiState.loading() = _Loading;
  const factory ProvinsiState.error({required String message}) = _Error;
  const factory ProvinsiState.loaded({required List<RegionModel> lProvinsi}) =
      _Loaded;
}
