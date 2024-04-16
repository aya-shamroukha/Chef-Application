// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:chef_app/domain/models/meal_model/add_meal_model.dart';

class AddMealEvent extends Equatable {
  const AddMealEvent();

  @override
  List<Object> get props => [];
}
class AddMealSuccess extends AddMealEvent {
 AddMealModel addMealModel; 
  AddMealSuccess({
    required this.addMealModel,
  });

}
