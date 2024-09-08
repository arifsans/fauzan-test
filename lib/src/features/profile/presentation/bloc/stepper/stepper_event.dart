part of 'stepper_bloc.dart';

@freezed
class StepperEvent with _$StepperEvent {
  const factory StepperEvent.updateStep({required int index}) = _UpdateStep;
}
