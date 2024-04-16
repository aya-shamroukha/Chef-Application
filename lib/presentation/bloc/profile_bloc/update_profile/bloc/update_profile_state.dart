 import 'package:equatable/equatable.dart';

class UpdateProfileState extends Equatable {
  const UpdateProfileState();
  
  @override
  List<Object> get props => [];
}

final class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileSuccessState extends UpdateProfileState{

}
class UpdateProfileLodingState extends UpdateProfileState{

}
class UpdateProfileFailedState extends UpdateProfileState{

}