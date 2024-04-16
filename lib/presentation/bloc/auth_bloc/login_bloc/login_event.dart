


import 'package:chef_app/domain/models/chef_model/login_model.dart';
import 'package:equatable/equatable.dart';

class LoginEvent  extends Equatable{
  @override
  List<Object> get props => [];
}
class LoginSuccess extends LoginEvent{

  final LogInModelRequest logInModel;

  LoginSuccess({required this.logInModel});
   @override
  List<Object> get props => [logInModel];
}
