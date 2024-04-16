

import 'package:chef_app/data/service/chef_service.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/reset_password_bloc/resetpassword_event.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/reset_password_bloc/resetpassword_state.dart';



import 'package:chef_app/presentation/pages/auth/send_code.dart';
import 'package:chef_app/presentation/widget/mytextfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ResetpasswordBloc extends Bloc<ResetpasswordEvent, ResetpasswordState> {
      GlobalKey<FormState> resetcode=GlobalKey<FormState>();

  ResetpasswordBloc() : super(ResetpasswordInitial()) {
    on<ResetPasswordScuccess>((event, emit) async{
    emit(ResetpasswordLoadingState());
     final isSuccess = await ChefImpl().forgetPassChange(
 emailsendController.text,
 newpasswordcontroller.text,
      
 passwordconfirmationcontroller.text,
      codeController.text,
 );
     if(isSuccess){
      emit(ResetpasswordSuccessState());
     }else{
      emit(ResetpasswordFaildState());
     }
      
    });
  }
}
