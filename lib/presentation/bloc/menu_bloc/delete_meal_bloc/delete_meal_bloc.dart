

import 'package:chef_app/data/service/meal_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'delete_meal_event.dart';
import 'delete_meal_state.dart';

class DeleteMealBloc extends Bloc<DeleteMealEvent, DeleteMealState> {
  DeleteMealBloc() : super(DeleteMealInitial()) {
    on<DeleteMealSuccessEvent>((event, emit)async {
    emit(DeleteMealLodingState());
    final res=await MealImpl().deleteMeal(event.id);
    if(res){
      emit(DeleteMealSuccessState());
    }
    });
  }
}
