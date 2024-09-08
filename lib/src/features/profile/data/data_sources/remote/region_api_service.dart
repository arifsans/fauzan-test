import 'package:chopper/chopper.dart';

part 'region_api_service.chopper.dart';

@ChopperApi()
abstract class RegionApiService extends ChopperService {
  @Get(path: '/data-indonesia/provinsi.json')
  Future<Response> getProvinsi();

  @Get(path: '/data-indonesia/kabupaten/{idProvinsi}.json')
  Future<Response> getKabupaten(
    @Path('idProvinsi') String idProvinsi,
  );

  @Get(path: '/data-indonesia/kecamatan/{idKabupaten}.json')
  Future<Response> getKecamatan(
    @Path('idKabupaten') String idKabupaten,
  );

  @Get(path: '/data-indonesia/kelurahan/{idKecamatan}.json')
  Future<Response> getKelurahan(
    @Path('idKecamatan') String idKecamatan,
  );

  static RegionApiService create([ChopperClient? client]) =>
      _$RegionApiService(client);

  // static RegionApiService create() {
  //   final client = ChopperClient(
  //     baseUrl: Uri.parse('https://ibnux.github.io'),
  //     services: [
  //       _$RegionApiService(),
  //     ],
  //     converter: const JsonConverter(),
  //     interceptors: [
  //       HttpLoggingInterceptor(),
  //     ],
  //   );
  //   return _$RegionApiService(client);
  // }
}
