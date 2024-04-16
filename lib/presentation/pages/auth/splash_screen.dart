

// ignore_for_file: use_build_context_synchronously

import 'package:chef_app/data/localSotrge/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utilities/assets.dart';
import '../../../utilities/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    Future.delayed(const Duration(seconds: 3),()async{
       await getIt.get<SharedPreferences>().getString(
          'token')==null?
Navigator.of(context).pushReplacementNamed("changelan"):
Navigator.of(context).pushReplacementNamed("homescreen");
      //GoRouter.of(context).go(Routes().changeLang);
    });
  }
  @override
  void dispose() {
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:AppColors.primary,
    body: Center(child: 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         SizedBox(
          height: 120.h,
          width: 120.w,
          child: Image.asset(AssetsImage().logo)),
          SizedBox(height: 16.h,),
         Text('Chef App',style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.black),)

    ],),), 
    );
  }
}