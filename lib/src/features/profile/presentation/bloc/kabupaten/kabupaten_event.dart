part of 'kabupaten_bloc.dart';

@freezed
class KabupatenEvent with _$KabupatenEvent {
  const factory KabupatenEvent.get({required String idProvinsi}) = _Get;
}
