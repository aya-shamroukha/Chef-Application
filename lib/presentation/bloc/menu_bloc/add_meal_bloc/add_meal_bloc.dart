
import 'package:chef_app/data/service/meal_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_meal_event.dart';
import 'add_meal_state.dart';



class AddMealBloc extends Bloc<AddMealEvent, AddMealState> {

  TextEditingController nameController = TextEditingController();
  
   GlobalKey<FormState> addmeal=GlobalKey<FormState>();

TextEditingController priceController = TextEditingController();
List categoryList=[
  'Beef',
  'Chicken',
  'Fish',
  'Seafood',
  'Pork',
  'Lamb',
  'Vegetarian',
  'Vegan',
  'Gluten-free'
];
dynamic firstitem='Beef';
dynamic groupValue='quantity';
TextEditingController descriptionController = TextEditingController();
  AddMealBloc() : super(AddMealInitial()){
    on<AddMealSuccess>((event, emit)async {
      emit(AddMealLodingState());
 dynamic res=    await MealImpl().addMeal(event.addMealModel);

  print('-------------');
 print(res);
 
  emit(AddMealSuccessState());
  print('emait successsss');
 
 


  //emit(AddMealFailedState());

 

    });
  }
}
