// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:chef_app/domain/models/chef_model/change_passowrd.dart';

class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordSuccessEvent extends ChangePasswordEvent {
   final ChangePasswordModel changePasswordModel;
  ChangePasswordSuccessEvent({
    required this.changePasswordModel,
  });
   @override
  List<Object> get props => [changePasswordModel];
}
