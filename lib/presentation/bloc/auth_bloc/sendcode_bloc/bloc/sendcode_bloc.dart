import 'package:chef_app/data/service/chef_service.dart';

import 'package:chef_app/presentation/pages/auth/send_code.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sendcode_event.dart';
part 'sendcode_state.dart';

class SendcodeBloc extends Bloc<SendcodeEvent, SendcodeState> {
    GlobalKey<FormState> sendcode=GlobalKey<FormState>();
  SendcodeBloc() : super(SendcodeInitial()) {
    on<SendCodeSuccess>((event, emit) async{
       emit(SendCodeLoadingState());
    final isSuccess = await ChefImpl().forgetPassSendCode(emailsendController.text);
      //  SendCodeModel sendCodeModel=
      //    SendCodeModel.fromMap((isSuccess));
  
    if(isSuccess){
      emit(SendCodeSuccessState());
    }else{
      emit(SendCodeFaildState('error'));
    }
    });
  }
}
