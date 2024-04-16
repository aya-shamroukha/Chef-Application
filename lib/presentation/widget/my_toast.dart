import 'package:chef_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showTost({

  required String message,
  required ToastState state
}){


Fluttertoast.showToast(msg: message,
 
toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: getState(state),
        textColor: AppColors.black,
        fontSize: 16.0
);

}
enum ToastState{error,success,warining}
Color getState(ToastState state){
switch (state){

  case ToastState.error:
  return AppColors.red;
  case ToastState.success:
  return AppColors.primary;
  case ToastState.warining:
  return AppColors.primaryBlod;
}
}