// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:chef_app/domain/models/meal_model/meal_model.dart';

class GetMealsState extends Equatable {
  const GetMealsState();
  
  @override
  List<Object> get props => [];
}

final class GetMealsInitial extends GetMealsState {}
class GetMealSuccessState extends GetMealsState {

   final List <GetChefMealModel> getChefMealModel;
  GetMealSuccessState({
    required this.getChefMealModel,
  });
}



class GetMealsLodingState extends GetMealsState{

}
class GetMealsFailedState extends GetMealsState{

}