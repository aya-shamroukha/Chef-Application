// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable

import 'package:chef_app/presentation/widget/mysizedbox.dart';
import 'package:chef_app/utilities/colors.dart';
import 'package:chef_app/utilities/string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextEditingController passwordController = TextEditingController();
TextEditingController passwordchangeController = TextEditingController();
TextEditingController discrptionprofileController = TextEditingController();
TextEditingController brandNamecontroller = TextEditingController();
TextEditingController minimumChargecontroller = TextEditingController();
TextEditingController nameprofileController = TextEditingController();
TextEditingController numberprofileontroller = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController codeController = TextEditingController();
TextEditingController newpasswordcontroller= TextEditingController();
TextEditingController passwordconfirmationcontroller= TextEditingController();
TextEditingController oldpasswordcontroller= TextEditingController();
TextEditingController passwordchangeconfirmation= TextEditingController();

class PasswordTextField extends StatelessWidget {
  PasswordTextField({
    super.key,
    required this.labeltext, required this.controller,
  });
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final String labeltext;
 final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    bool is_weak = true;
    bool is_secret = true;
    return StatefulBuilder(builder: (context, setstate) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              obscureText: is_secret,
               autovalidateMode: AutovalidateMode.onUserInteraction,
             
              onChanged: (value) {
                if (value.length < 8) {
                  setstate(() {
                    is_weak = true;
                  });
                } else {
                  setstate(() {
                    is_weak = false;
                  });
                }
              },
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                suffixText: is_weak ? AppStrings().weak.tr() : AppStrings().strong.tr(),
                suffixStyle:
                    TextStyle(color: (is_weak) ? Colors.red : Colors.green),
                suffixIcon: IconButton(
                    onPressed: () {
                      setstate(() {
                        is_secret = !is_secret;
                      });
                    },
                    icon: Icon(
                      is_secret ? Icons.visibility_off : Icons.remove_red_eye,
                      color: AppColors.primary,
                    )),
                focusedBorder:
                    Theme.of(context).inputDecorationTheme.focusedBorder,
                enabledBorder:
                    Theme.of(context).inputDecorationTheme.enabledBorder,
                      errorBorder: 
                Theme.of(context).inputDecorationTheme.errorBorder,
                labelText: labeltext,
                labelStyle: TextStyle(fontSize: 14.sp, color: AppColors.gray ),
              ),
            ),
          ],
        ),
      );
    });
  }
}









class Textfield extends StatelessWidget {
  
   const Textfield({
    super.key,
    this.validate,
    required this.labeltext, required this.controller, required this.textInputType,
  });
 
  final String labeltext;
  final TextEditingController controller;
final dynamic validate;
final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setstate) {
      return Padding(
        padding: const EdgeInsets.only(left: 24,right: 24,bottom: 10,top: 0),
        child: Column(
          children: [
            TextFormField(
           keyboardType:textInputType ,
              validator: validate,
               autovalidateMode: AutovalidateMode.onUserInteraction,

              controller: controller,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                errorBorder: 
                Theme.of(context).inputDecorationTheme.errorBorder,
                focusedBorder:
                    Theme.of(context).inputDecorationTheme.focusedBorder,
                enabledBorder:
                    Theme.of(context).inputDecorationTheme.enabledBorder,
                labelText: labeltext,
                labelStyle: TextStyle(fontSize: 14.sp, color: AppColors.gray),
              ),
            ),
          ],
        ),
      );
    });
  }
}


















class NewPasswordTextField extends StatelessWidget {


  NewPasswordTextField({
    super.key,
    required this.labeltext, required this.controller, required this.labeltext2, required this.controller2,
  });
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final String labeltext;
   final String labeltext2;
  final TextEditingController controller;
  final TextEditingController controller2;


@override
  Widget build(BuildContext context) {
    

  
      
    bool is_weak = true;
        bool is_secret = true;
         bool is_secret2 = true;
    bool is_match = true;
    return StatefulBuilder(builder: (context, setstate) {
      return Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TextFormField(
                obscureText: is_secret,
              //  autovalidateMode: AutovalidateMode.always,
             // key: formstate,
              onChanged: (value) {
                if (value.length < 8) {
                  setstate(() {
                    is_weak = true;
                  });
                } else {
                  setstate(() {
                    is_weak = false;
                  });
                }
              },
               validator: (text){
        if(text!.isEmpty){
         // print(passwordController.text);
                return AppStrings().passwordisnotidentical.tr();
                
        }return null;
      },
              controller: controller,
              cursorColor: Colors.grey,
                 decoration: InputDecoration(
              suffixText: is_weak ? AppStrings().weak.tr() : AppStrings().strong.tr(),
              suffixStyle:
                  TextStyle(color: (is_weak) ? Colors.red : Colors.green),
              suffixIcon: IconButton(
                  onPressed: () {
                    setstate(() {
                      is_secret = !is_secret;
                    });
                  },
                  icon: Icon(
                    is_secret ? Icons.visibility_off : Icons.remove_red_eye,
                    color: AppColors.primary,
                  )),
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.focusedBorder,
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
                    errorBorder: 
              Theme.of(context).inputDecorationTheme.errorBorder,
              labelText: labeltext,
              labelStyle: TextStyle(fontSize: 14.sp, color:AppColors.gray),
              ),
            ),
            SizedBox_Height(height: 10.h),
            //confirm
            TextFormField(
      autovalidateMode: AutovalidateMode.always,      
    
               validator: (text){
        if(passwordconfirmationcontroller.text!= newpasswordcontroller.text){
         // print(passwordController.text);
                return AppStrings().passwordisnotidentical.tr();
        }return null;
      },
              onChanged:(val){
                if(passwordconfirmationcontroller.text!= newpasswordcontroller.text) {
                  setstate((){
                  is_match=true;
                });
                } else {
                     setstate((){
    
                  is_match = false;
                  });
                }
              } ,  obscureText: is_secret2,
              //  autovalidateMode: AutovalidateMode.always,
              controller: controller2,
              cursorColor: Colors.grey,
                decoration:  InputDecoration(
             suffix: Icon(is_match?Icons.check:Icons.check,color:is_match?Colors.white:Colors.green),
               
              suffixIcon: IconButton(
                  onPressed: () {
                    setstate(() {
                      is_secret2 = !is_secret2;
                    });
                  },
                  icon: Icon(
                    is_secret ? Icons.visibility_off : Icons.remove_red_eye,
                    color: AppColors.primary,
                  )),
              
             
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.focusedBorder,
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
                    errorBorder: 
              Theme.of(context).inputDecorationTheme.errorBorder,
              labelText: labeltext2,
              labelStyle: TextStyle(fontSize: 14.sp, color:AppColors.gray),
              ),
            ),
          ],
        ),
      );
    });
  }
}