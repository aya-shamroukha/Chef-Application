
import 'package:chef_app/domain/models/chef_model/login_model.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/login_bloc/login_bloc.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/login_bloc/login_event.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/login_bloc/login_state.dart';
import 'package:chef_app/presentation/widget/my_loading.dart';
import 'package:chef_app/presentation/widget/my_toast.dart';
import 'package:chef_app/presentation/widget/mybutton.dart';
import 'package:chef_app/presentation/widget/mysizedbox.dart';
import 'package:chef_app/presentation/widget/mytextfield.dart';
import 'package:chef_app/utilities/assets.dart';
import 'package:chef_app/utilities/colors.dart';
import 'package:chef_app/utilities/string.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
TextEditingController emailController=TextEditingController();
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                //  fit: StackFit.expand,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        AssetsImage().background2,
                        fit: BoxFit.cover,
                      )),
                  Center(
                      child: Text(
                    AppStrings().welcomeback.tr(),
                    style: Theme.of(context).textTheme.displayLarge,
                  )),
                ],
              ),
              SizedBox_Height(height: 60.h),
              BlocConsumer<LoginBloc, LoginState>(
               // listenWhen: (previous, current) => previous!=current,
                listener: (context, state) {
                  if(state is LoginSuccessState ){
                    
    showTost(message: AppStrings().loginSucessfully.tr(), state: ToastState.success);
                           Navigator.of(context).pushReplacementNamed('homescreen');

                  } 
                  else if( state is LoginFailed){
                    print('--------------- loginfaild');
    showTost(message: AppStrings().loginFailed.tr(), state: ToastState.error);
    
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: BlocProvider.of<LoginBloc>(context).login, 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textfield(
                          textInputType: TextInputType.emailAddress,
                          validate: (value){
              if(value!.isEmpty|| !value.contains('@gmail.com')){
                return AppStrings().valiemail.tr();
              }else{
                return null;
              }
            },
                          controller: emailController,
                          labeltext: AppStrings().email.tr(),
                        ),
                        PasswordTextField(
                          controller: passwordController,
                          labeltext: AppStrings().password.tr(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).pushReplacementNamed('sendcode');
                            },
                              child: Text(
                            AppStrings().forgetpassword.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: AppColors.gray),
                          )),
                        ),
                        SizedBox_Height(height: 20.h),
                        Center(
                            child:
                            
                            state is LoadingState? const Loading():
                             MyButton(
                          width: 327,
                          onPressed: () {
                             if(BlocProvider.of<LoginBloc>(context).login.currentState!.validate()){
                           context.read<LoginBloc>().add(
                            LoginSuccess(logInModel: LogInModelRequest(email: emailController.text,password: passwordController.text)),
                           );
                          }
                       // context.read<LoginBloc>().add(LoginSuccess());
                          },
                          text: AppStrings().signin.tr(),
                        )),
                        SizedBox_Height(height: 20.h),
                        InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings().haveanaccount.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(color: AppColors.gray),
                              ),
                              SizedBox_width(width: 10.h),
                              Text(
                                AppStrings().signUp.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: AppColors.primary, fontSize: 20),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                  //"ammarfathy516@gmail.com anas123
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

