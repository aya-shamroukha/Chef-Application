part of 'sendcode_bloc.dart';

sealed class SendcodeState extends Equatable {
  const SendcodeState();
  
  @override
  List<Object> get props => [];
}

final class SendcodeInitial extends SendcodeState {}
class SendCodeSuccessState extends SendcodeState{

  // final SendCodeModel sendCodeModel;

  // SendCodeSuccessState({required this.sendCodeModel});
}
class SendCodeLoadingState extends SendcodeState{}

class SendCodeFaildState extends SendcodeState{

  final String error;

  SendCodeFaildState(this.error);
}