import 'package:chef_app/data/service/chef_service.dart';
import 'package:chef_app/domain/models/meal_model/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/localSotrge/localStorage.dart';
import 'get_meals_event.dart';
import 'get_meals_state.dart';

class GetMealsBloc extends Bloc<GetMealsEvent, GetMealsState> {
  GetMealsBloc() : super(GetMealsInitial()) {
    on<GetMealSuccessEvent>((event, emit) async{
      emit(GetMealsLodingState()); 
   var meal= await ChefImpl().getChefMeal(getIt.get<SharedPreferences>().getString('id'));
   print(meal);
    List<GetChefMealModel> meals=List.generate(
        meal['meals'].length, (index) => GetChefMealModel.fromMap((meal['meals'][index])));
      emit(GetMealSuccessState(getChefMealModel: meals));
    });
  }
}
