import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nutrifacts/feature/food_nutrition_information/data/datasources/user_preferences.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/user_preferences/user_preferences_state.dart';

@injectable
class UserPreferencesCubit extends Cubit<UserPreferencesState> {
  final UserPreferences _userPreferences;

  UserPreferencesCubit(this._userPreferences)
      : super(const UserPreferencesState());

  void fetchThemeColor() {
    final color = _userPreferences.getThemeColor();
    emit(UserPreferencesState(themeColor: color));
  }

  void setThemeColor(Color color) async {
    final isSuccess = await _userPreferences.setThemeColor(color);
    if (isSuccess) {
      fetchThemeColor();
    }
  }
}
