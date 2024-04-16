
import 'package:chef_app/data/service/chef_service.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/login_bloc/login_event.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/login_bloc/login_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
   GlobalKey<FormState> login=GlobalKey<FormState>();
  LoginBloc() : super(LoginInitial()) {
    on<LoginSuccess>((event, emit) async{
    emit(LoadingState());
    final isSuccess = await ChefImpl().signIn(event.logInModel);
     if(isSuccess==true){
    emit(LoginSuccessState());
}
else{
  emit(LoginFailed());
}
    });
  }
}
