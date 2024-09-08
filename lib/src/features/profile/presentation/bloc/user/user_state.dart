part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.loaded() = _Loaded;
  const factory UserState.error({required String message}) = _Error;
  const factory UserState.dataLoaded({
    required User userData,
  }) = _DataLoaded;
  const factory UserState.successUpdate() = _SuccessUpdate;
}
