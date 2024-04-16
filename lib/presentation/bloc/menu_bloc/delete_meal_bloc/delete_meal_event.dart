 import 'package:equatable/equatable.dart';

class DeleteMealEvent extends Equatable {
  const DeleteMealEvent();

  @override
  List<Object> get props => [];
}
class DeleteMealSuccessEvent extends DeleteMealEvent{

  final String id;

  DeleteMealSuccessEvent(this.id); 
}