// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nutrifacts/core/di/service_locator.dart' as _i223;
import 'package:nutrifacts/feature/food_nutrition_information/data/datasources/user_preferences.dart'
    as _i878;
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/user_preferences/user_preferences_cubit.dart'
    as _i275;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => dataModule.prefs,
      preResolve: true,
    );
    gh.factory<_i878.UserPreferences>(
        () => _i878.UserPreferences(gh<_i460.SharedPreferences>()));
    gh.factory<_i275.UserPreferencesCubit>(
        () => _i275.UserPreferencesCubit(gh<_i878.UserPreferences>()));
    return this;
  }
}

class _$DataModule extends _i223.DataModule {}
