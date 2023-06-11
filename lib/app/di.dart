import 'package:curso_flutter_avancado/app/app_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


// di -> dependency injection


final instance = GetIt.instance;

Future<void> initAppModule() async {

  final sharedPreferences = SharedPreferences.getInstance();

  // shred preferences instance
  instance.registerLazySingleton(() => sharedPreferences);

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

}
