import 'package:chef_app/presentation/bloc/auth_bloc/sendcode_bloc/bloc/sendcode_bloc.dart';
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
TextEditingController emailsendController=TextEditingController();
class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: skipButton(
          (){
            Navigator.of(context).pushReplacementNamed('login');
          }
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(AppStrings().sendCodeAppbar.tr()),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: BlocConsumer<SendcodeBloc, SendcodeState>(
            listener: (context, state) {
                if(state is SendCodeSuccessState ){
                      
showTost(message: AppStrings().sendCodeSuccess.tr(), state: ToastState.success);
Navigator.of(context).pushReplacementNamed('resetpassword');
                    } 
                    else if( state is SendCodeFaildState){
                      print('--------------- loginfaild');
showTost(message: AppStrings().sendcodeFailed.tr(), state: ToastState.error);

                    }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<SendcodeBloc>(context).sendcode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Image.asset(AssetsImage().lock),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        AppStrings().sendCodeText.tr(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Textfield(
                      validate: (value){
                if(value!.isEmpty|| !value.contains('@gmail.com')){
                  return AppStrings().valiemail.tr();
                }else{
                  return null;
                }
              },
                      textInputType: TextInputType.emailAddress,
                      labeltext: AppStrings().email.tr(),
                      controller: emailsendController,
                    ),
                    SizedBox_Height(height: 30.h),
                    state is SendCodeLoadingState? const Loading():
                    MyButton(
                        width: 327,
                        
                        onPressed: () {
        //  context.read<SendcodeBloc>().add(SendCodeSuccess(email:emailsendController.text ));
                           
                          if(BlocProvider.of<SendcodeBloc>(context).sendcode.currentState!.validate()){
                           context.read<SendcodeBloc>().add(SendCodeSuccess());
                          }
                        },
                        text: AppStrings().sendCode.tr())
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
