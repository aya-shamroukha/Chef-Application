 import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState();
  
  @override
  List<Object> get props => [];
}

final class ChangePasswordInitial extends ChangePasswordState {}
class ChangePasswordSuccessState extends ChangePasswordState{

}
class ChangePasswordLodingState extends ChangePasswordState{

}
class ChangePasswordFailedState extends ChangePasswordState{

}