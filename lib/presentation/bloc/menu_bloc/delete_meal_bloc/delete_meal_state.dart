 import 'package:equatable/equatable.dart';

class DeleteMealState extends Equatable {
  const DeleteMealState();
  
  @override
  List<Object> get props => [];
}

final class DeleteMealInitial extends DeleteMealState {}
class DeleteMealSuccessState extends DeleteMealState{

}
class DeleteMealLodingState extends DeleteMealState{

}
class DeleteMealFailedState extends DeleteMealState{

}