// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$RegionApiService extends RegionApiService {
  _$RegionApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = RegionApiService;

  @override
  Future<Response<dynamic>> getProvinsi() {
    final Uri $url = Uri.parse('/data-indonesia/provinsi.json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getKabupaten(String idProvinsi) {
    final Uri $url = Uri.parse('/data-indonesia/kabupaten/${idProvinsi}.json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getKecamatan(String idKabupaten) {
    final Uri $url = Uri.parse('/data-indonesia/kecamatan/${idKabupaten}.json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getKelurahan(String idKecamatan) {
    final Uri $url = Uri.parse('/data-indonesia/kelurahan/${idKecamatan}.json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
