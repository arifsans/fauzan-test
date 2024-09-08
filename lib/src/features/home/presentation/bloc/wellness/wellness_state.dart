part of 'wellness_bloc.dart';

@freezed
class WellnessState with _$WellnessState {
  const factory WellnessState.initial() = _Initial;
  const factory WellnessState.loading() = _Loading;
  const factory WellnessState.loaded() = _Loaded;
  const factory WellnessState.error({required String message}) = _Error;
  const factory WellnessState.dataLoaded({
    required List<Wellness> wellnessData,
  }) = _DataLoaded;
}
