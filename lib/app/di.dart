import 'package:curso_flutter_avancado/app/app_preferences.dart';
import 'package:curso_flutter_avancado/data/network/network_info.dart';
import 'package:curso_flutter_avancado/data/repository/repository_impl.dart';
import 'package:curso_flutter_avancado/domain/repository/repository.dart';
import 'package:curso_flutter_avancado/domain/usecase/forgot_password_usecase.dart';
import 'package:curso_flutter_avancado/domain/usecase/home_usecase.dart';
import 'package:curso_flutter_avancado/domain/usecase/login_usecase.dart';
import 'package:curso_flutter_avancado/domain/usecase/register_usecase.dart';
import 'package:curso_flutter_avancado/presentation/forgot_pasword/forgot_password_viewmodel.dart';
import 'package:curso_flutter_avancado/presentation/main/home/home_viewmodel.dart';
import 'package:curso_flutter_avancado/presentation/register/register_viewmodel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../presentation/login/login_viewmodel.dart';

// di -> dependency injection

GetIt instance = GetIt.instance;

Future<void> initAppModule() async {

  final sharedPreferences = await SharedPreferences.getInstance();

  // shared preferences instance
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

initLoginModule(){
  instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
}

initForgotPasswordModule(){
  instance.registerFactory<ForgotPasswordUseCase>(() => ForgotPasswordUseCase(instance()));
  instance.registerFactory<ForgotPasswordViewModel>(() => ForgotPasswordViewModel(instance()));
}

initRegisterModule(){
  instance.registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
  instance.registerFactory<RegisterViewModel>(() => RegisterViewModel(instance()));
  //instance.registerFactory<ImagePicker>(() => ImagePicker());
}

initHomeModule(){
  instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
  instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
}
