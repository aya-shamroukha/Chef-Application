

import 'package:chef_app/data/service/chef_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_password_event.dart';
import 'change_password_state.dart';



class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordSuccessEvent>((event, emit)async {
      emit(ChangePasswordLodingState());
     var isSuccess = await ChefImpl().changePassword(event.changePasswordModel);
      print('-----------');
      print(isSuccess);
      if (isSuccess) {
        emit(ChangePasswordSuccessState());
      } else {
        emit(ChangePasswordFailedState());
      }
    });
  }
}
