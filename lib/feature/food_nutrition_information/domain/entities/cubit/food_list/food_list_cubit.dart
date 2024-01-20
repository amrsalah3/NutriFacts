import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nutrifacts/core/common/domain/entities/api_result.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/entities/cubit/food_list/food_list_state.dart';
import 'package:nutrifacts/feature/food_nutrition_information/domain/repositories/food_repository.dart';

class FoodListCubit extends Cubit<FoodListState> {
  FoodListCubit(this._foodRepository) : super(FoodListState());

  final FoodRepository _foodRepository;

  void getFoodList(String name) async {
    emit(FoodListState(status: FoodListStatus.loading));
    final result = await _foodRepository.getFoods(name);
    switch (result) {
      case Success():
        emit(FoodListState(status: FoodListStatus.success, foods: result.data));

      case Failure():
        emit(FoodListState(status: FoodListStatus.failure));
    }
  }
}
