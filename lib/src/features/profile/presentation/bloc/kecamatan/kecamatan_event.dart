part of 'kecamatan_bloc.dart';

@freezed
class KecamatanEvent with _$KecamatanEvent {
  const factory KecamatanEvent.get({required String idKabupaten}) = _Get;
}
