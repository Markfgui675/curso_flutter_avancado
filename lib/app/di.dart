import 'package:curso_flutter_avancado/app/app_preferences.dart';
import 'package:curso_flutter_avancado/data/network/network_info.dart';
import 'package:curso_flutter_avancado/data/repository/repository_impl.dart';
import 'package:curso_flutter_avancado/domain/repository/repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';


// di -> dependency injection


final instance = GetIt.instance;

Future<void> initAppModule() async {

  final sharedPreferences = await SharedPreferences.getInstance();

  // shred preferences instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplement(DataConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImplementer(instance()));

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance()));


}
