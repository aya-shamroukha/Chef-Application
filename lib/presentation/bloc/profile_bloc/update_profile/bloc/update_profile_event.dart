// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:chef_app/domain/models/chef_model/updateprofile.dart';

class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();

  @override
  List<Object> get props => [];
}
class UpdateProfileSuccessEvent extends UpdateProfileEvent {
  UpdateProfileModel updateProfileModel;
  UpdateProfileSuccessEvent({
    required this.updateProfileModel,
  });
   @override
  List<Object> get props => [updateProfileModel];
}
