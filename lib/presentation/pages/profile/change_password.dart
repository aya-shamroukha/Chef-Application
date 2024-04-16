import 'package:chef_app/domain/models/chef_model/change_passowrd.dart';
import 'package:chef_app/presentation/bloc/profile_bloc/change_password/bloc/change_password_bloc.dart';
import 'package:chef_app/presentation/bloc/profile_bloc/change_password/bloc/change_password_event.dart';
import 'package:chef_app/presentation/bloc/profile_bloc/change_password/bloc/change_password_state.dart';
import 'package:chef_app/presentation/widget/my_loading.dart';
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

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(AppStrings().changepassword.tr()),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
            listener: (context, state) {
              if(state is ChangePasswordSuccessState){
                      showTost(message: AppStrings().update.tr(), state: ToastState.success);
                     
                    }
                    else if(state is ChangePasswordFailedState){
                       showTost(message: 'failed', state: ToastState.error);
                    }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    child: Image.asset(AssetsImage().lock),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      AppStrings().changepassword.tr(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Textfield(
                      textInputType: TextInputType.name,
                      labeltext: AppStrings().oldpassword.tr(),
                      controller: oldpasswordcontroller),
                  NewPasswordTextField(
                    labeltext: AppStrings().newpassword.tr(),
                    labeltext2: AppStrings().confirmPassword.tr(),
                    controller: passwordchangeController,
                    controller2: passwordchangeconfirmation,
                  ),
                  SizedBox_Height(height: 10.h),
                  SizedBox_Height(height: 20.h),
                  state is ChangePasswordLodingState? const Loading():

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: MyButton(
                        width: 327,
                        onPressed: () {
                            context.read<ChangePasswordBloc>().add(
                              ChangePasswordSuccessEvent(
                                changePasswordModel: ChangePasswordModel(
                                  confirmPassword:passwordchangeconfirmation.text, 
                                  newPass: passwordchangeController.text, 
                                  oldPass: oldpasswordcontroller.text)
                              )
                              );

                          // if(BlocProvider.of<ResetpasswordBloc>(context).resetcode.currentState!.validate()){
                          //  context.read<ResetpasswordBloc>().add(ResetPasswordScuccess(
                          //  )
                          //  );
                          // }
                        },
                        text: AppStrings().changepassword.tr()),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
