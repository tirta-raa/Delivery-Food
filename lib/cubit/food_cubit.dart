import 'package:bloc/bloc.dart';
import 'package:deliveryfood/models/models.dart';
import 'package:deliveryfood/services/services.dart';
import 'package:equatable/equatable.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFood() async {
    ApiReturnValue<List<Food>> result = await FoodServices.getFoods();

    if (result.value != null) {
      emit(FoodLoaded(result.value));
    } else {
      emit(FoodLoadingFaild(result.message));
    }
  }
}
