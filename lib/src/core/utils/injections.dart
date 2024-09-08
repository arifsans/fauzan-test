import 'package:chopper/chopper.dart';
import 'package:fauzan_test/src/core/network/chopper_client.dart';
import 'package:fauzan_test/src/features/profile/data/data_sources/remote/region_api_service.dart';
import 'package:fauzan_test/src/features/profile/data/repositories/region_repository.dart';
import 'package:fauzan_test/src/shared/data/data_sources/local/user_database.dart';
import 'package:fauzan_test/src/shared/data/data_sources/local/wellness_database.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> initInjections() async {
  await initSharedPrefsInjections();
  await initWellnessDB();
  await initUserDB();
  initProvinsiApiService();
}

Future<void> initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

Future<void> initWellnessDB() async {
  final database = await $FloorWellnessDatabase
      .databaseBuilder('wellness_database.db')
      .build();

  sl.registerSingleton<WellnessDatabase>(database);
}

Future<void> initUserDB() async {
  final database =
      await $FloorUserDatabase.databaseBuilder('user_database.db').build();

  sl.registerSingleton<UserDatabase>(database);
}

void initProvinsiApiService() {
  sl.registerLazySingleton(() => createChopperClient());
  sl.registerLazySingleton(
    () => RegionApiService.create(sl<ChopperClient>()),
  );
  sl.registerLazySingleton(
    () => RegionRepository(sl<RegionApiService>()),
  );
}
