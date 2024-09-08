part of 'sliding_panel_bloc.dart';

@freezed
class SlidingPanelEvent with _$SlidingPanelEvent {
  const factory SlidingPanelEvent.update({required bool isOpen}) = _Update;
}
