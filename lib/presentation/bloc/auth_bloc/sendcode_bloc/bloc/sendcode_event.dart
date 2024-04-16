part of 'sendcode_bloc.dart';

sealed class SendcodeEvent extends Equatable {
  const SendcodeEvent();

  @override
  List<Object> get props => [];
}
class SendCodeSuccess extends SendcodeEvent{

}