import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nutrifacts/feature/food_nutrition_information/data/datasources/user_preferences.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/user_preferences/user_preferences_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'service_locator.config.dart';

final locator = GetIt.instance;

@injectableInit
Future setupDependencies() async => await locator.init();

@module
@singleton
abstract class DataModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
