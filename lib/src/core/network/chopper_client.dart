import 'package:chopper/chopper.dart';
import 'package:fauzan_test/src/features/profile/data/data_sources/remote/region_api_service.dart';

ChopperClient createChopperClient() {
  return ChopperClient(
    baseUrl: Uri.parse('https://ibnux.github.io'),
    services: [
      RegionApiService.create(),
    ],
    converter: const JsonConverter(),
    interceptors: [
      HttpLoggingInterceptor(),
    ],
  );
}
