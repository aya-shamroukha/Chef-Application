import 'package:chef_app/data/localSotrge/localStorage.dart';
import 'package:chef_app/presentation/widget/mybutton.dart';
import 'package:chef_app/presentation/widget/mysizedbox.dart';
import 'package:chef_app/utilities/assets.dart';
import 'package:chef_app/utilities/colors.dart';
import 'package:chef_app/utilities/string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLangScreen extends StatefulWidget {
  const ChangeLangScreen({super.key});

  @override
  State<ChangeLangScreen> createState() => _ChangeLangScreenState();
}

class _ChangeLangScreenState extends State<ChangeLangScreen> {
  @override
  void initState() {
    super.initState();
    getIt.get<SharedPreferences>().getString('languagecode', );
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset( AssetsImage().background,fit: BoxFit.cover,)),
      Column(
        
       
        children: [
          SizedBox_Height(height: 116.h,),
          Image.asset(AssetsImage().logo),
          SizedBox_Height(height: 20.h,),
        Text(AppStrings().wlcome.tr(),style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.black),),
      SizedBox_Height(height: 40.h,),
      Text(AppStrings().chooseLan.tr(),style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black),),
      SizedBox_Height(height: 110.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
              MyButton(
                textcolor: AppColors.white,
                onPressed: () { 
                if (context.locale.languageCode ==
                              "ar") {
                            context.setLocale(const Locale("en"));
                          } else {
                  context.setLocale(const Locale("en"));
                }
                
                getIt.get<SharedPreferences>().setString('languagecode', 'en');
                 Future.delayed(const Duration(seconds: 1),(){
Navigator.of(context).pushReplacementNamed('login');
     // GoRouter.of(context).go(Routes().login);
    });
               },text: 'English',width: 140,background: AppColors.black,height: 40),
              
              MyButton(
                textcolor: AppColors.white,
                onPressed: () { 
                 if (context.locale.languageCode ==
                              "en") {
                            context.setLocale(const Locale("ar"));
                          } else {
                   context.setLocale(const Locale("ar"));
                 }
                 getIt.get<SharedPreferences>().setString('languagecode', 'ar');
                  Future.delayed(const Duration(seconds: 1),(){
Navigator.of(context).pushReplacementNamed('login');
    //  GoRouter.of(context).go(Routes().login);
    });
               },text: 'العربية',width: 140,background: AppColors.black,height: 40,),

      ],)
      ],),
      
         

      
        
         
           

    ],),
    
    
    
    
    );
  }
}

