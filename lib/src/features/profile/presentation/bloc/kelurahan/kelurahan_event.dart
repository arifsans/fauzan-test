part of 'kelurahan_bloc.dart';

@freezed
class KelurahanEvent with _$KelurahanEvent {
  const factory KelurahanEvent.get({required String idKecamatan}) = _Get;
}
