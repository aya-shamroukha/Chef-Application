 import 'package:equatable/equatable.dart';

class AddMealState extends Equatable {
  const AddMealState();
  
  @override
  List<Object> get props => [];
}

final class AddMealInitial extends AddMealState {}
class AddMealSuccessState extends AddMealState{

}
class AddMealLodingState extends AddMealState{

}
class AddMealFailedState extends AddMealState{

}