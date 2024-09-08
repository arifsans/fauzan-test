part of 'wellness_bloc.dart';

enum WellnessSorting { normal, termurah, termahal }

@freezed
class WellnessEvent with _$WellnessEvent {
  const factory WellnessEvent.checkAndInsertInitialData() =
      _CheckAndInsertInitialData;
  const factory WellnessEvent.getWellnessData({WellnessSorting? sort}) =
      _GetWellnessData;
}
