import 'package:fauzan_test/src/features/profile/data/data_sources/remote/region_api_service.dart';
import 'package:fauzan_test/src/features/profile/domain/models/region_model.dart';

class RegionRepository {
  final RegionApiService _regionApiService;

  RegionRepository(this._regionApiService);

  Future<List<RegionModel>> getProvinsi() async {
    try {
      final response = await _regionApiService.getProvinsi();

      if (response.isSuccessful) {
        final List<dynamic> jsonResponse = response.body;
        final provinsi = jsonResponse
            .map(
              (json) => RegionModel.fromJson(json as Map<String, dynamic>),
            )
            .toList();

        return provinsi;
      } else {
        throw Exception(
          'Failed to load data: ${response.error} (${response.statusCode})',
        );
      }
    } catch (e) {
      throw Exception(
        'Failed to load data: $e)',
      );
    }
  }

  Future<List<RegionModel>> getKabupaten({
    required String idProvinsi,
  }) async {
    final response = await _regionApiService.getKabupaten(idProvinsi);
    if (response.isSuccessful) {
      final List<dynamic> jsonResponse = response.body;
      final kabupaten = jsonResponse
          .map(
            (json) => RegionModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();

      return kabupaten;
    } else {
      throw Exception(
        'Failed to load data: ${response.error} (${response.statusCode})',
      );
    }
  }

  Future<List<RegionModel>> getKecamatan({
    required String idKabupaten,
  }) async {
    final response = await _regionApiService.getKecamatan(idKabupaten);
    if (response.isSuccessful) {
      final List<dynamic> jsonResponse = response.body;
      final kecamatan = jsonResponse
          .map(
            (json) => RegionModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();

      return kecamatan;
    } else {
      throw Exception(
        'Failed to load data: ${response.error} (${response.statusCode})',
      );
    }
  }

  Future<List<RegionModel>> getKelurahan({
    required String idKecamatan,
  }) async {
    final response = await _regionApiService.getKelurahan(idKecamatan);
    if (response.isSuccessful) {
      final List<dynamic> jsonResponse = response.body;
      final kelurahan = jsonResponse
          .map(
            (json) => RegionModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();

      return kelurahan;
    } else {
      throw Exception(
        'Failed to load data: ${response.error} (${response.statusCode})',
      );
    }
  }
}
