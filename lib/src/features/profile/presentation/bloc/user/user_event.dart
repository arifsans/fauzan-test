part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.checkAndInsertInitialData() =
      _CheckAndInsertInitialData;
  const factory UserEvent.getUserData() = _GetUserData;
  const factory UserEvent.updateUserData({required User user}) =
      _UpdateUserData;
}
