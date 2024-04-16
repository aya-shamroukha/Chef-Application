

 import 'package:equatable/equatable.dart';

class ResetpasswordState extends Equatable {
  const ResetpasswordState();
  
  @override
  List<Object> get props => [];
}

final class ResetpasswordInitial extends ResetpasswordState {}
class ResetpasswordLoadingState extends ResetpasswordState{}
class ResetpasswordSuccessState extends ResetpasswordState{}

class ResetpasswordFaildState extends ResetpasswordState{


}