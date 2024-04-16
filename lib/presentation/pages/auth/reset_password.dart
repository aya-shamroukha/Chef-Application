
import 'package:chef_app/presentation/bloc/auth_bloc/reset_password_bloc/resetpassword_bloc.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/reset_password_bloc/resetpassword_event.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/reset_password_bloc/resetpassword_state.dart';


import 'package:chef_app/presentation/widget/my_loading.dart';
import 'package:chef_app/presentation/widget/my_skip_button.dart';
import 'package:chef_app/presentation/widget/my_toast.dart';
import 'package:chef_app/presentation/widget/mybutton.dart';
import 'package:chef_app/presentation/widget/mysizedbox.dart';
import 'package:chef_app/presentation/widget/mytextfield.dart';
import 'package:chef_app/utilities/assets.dart';
import 'package:chef_app/utilities/string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // double media=MediaQuery.of(context).size.width/2 ;
    return Scaffold(
     appBar: AppBar(
       leading: skipButton(
          (){
            Navigator.of(context).pushReplacementNamed('sendcode');
          }
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(AppStrings().createNewPassword.tr()),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: BlocConsumer<ResetpasswordBloc, ResetpasswordState>(
            listener: (context, state) {
                if(state is ResetpasswordSuccessState ){
                      
showTost(message: AppStrings().resetPasswordScuccess.tr(), state: ToastState.success);
Navigator.of(context).pushReplacementNamed('login');
                    } 
                    else if( state is ResetpasswordFaildState){
                      print('--------------- loginfaild');
showTost(message: AppStrings().sendcodeFailed.tr(), state: ToastState.error);

                    }
            },
            builder: (context, state) {
              return Form(
               key: BlocProvider.of<ResetpasswordBloc>(context).resetcode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,
                      horizontal:50
                      
                       ),
                      child: Image.asset(AssetsImage().lock),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        AppStrings().createNewPassword.tr(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                   NewPasswordTextField(
                      labeltext: AppStrings().newpassword.tr(),
                      labeltext2:AppStrings().confirmPassword.tr() ,
                      controller: newpasswordcontroller,
                      controller2: passwordconfirmationcontroller,
                    ),SizedBox_Height(height: 10.h),
                    Textfield(
                      textInputType: TextInputType.number,
                      labeltext: AppStrings().code.tr(), controller: codeController),
                    SizedBox_Height(height: 20.h),
                    state is ResetpasswordLoadingState? const Loading():
                      
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: MyButton(
                          width: 327,
                          
                          onPressed: () {
                             //   context.read<SendcodeBloc>().add(SendCodeSuccess(email:emailsendController.text ));
                             
                            if(BlocProvider.of<ResetpasswordBloc>(context).resetcode.currentState!.validate()){
                             context.read<ResetpasswordBloc>().add(ResetPasswordScuccess(
                             )
                             );
                            }
                          },
                          text: AppStrings().resetpassword.tr()),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}