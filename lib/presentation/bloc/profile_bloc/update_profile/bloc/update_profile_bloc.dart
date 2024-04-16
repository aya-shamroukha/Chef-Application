import 'package:chef_app/data/service/chef_service.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'update_profile_event.dart';
import 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  GlobalKey<FormState> update = GlobalKey<FormState>();
  UpdateProfileBloc() : super(UpdateProfileInitial()) {
    on<UpdateProfileSuccessEvent>((event, emit) async {
      emit(UpdateProfileLodingState());
        print('----------- pefor is success');
      var isSuccess = await ChefImpl().updateChef(event.updateProfileModel);
      print('-----------');
      print(isSuccess);
      if (isSuccess) {
        emit(UpdateProfileSuccessState());
      } else {
        emit(UpdateProfileFailedState());
      }
    });
  }
}
