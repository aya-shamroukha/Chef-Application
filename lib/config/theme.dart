import 'package:chef_app/utilities/colors.dart';
import 'package:chef_app/utilities/textstyle.dart';
import 'package:flutter/material.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor: AppColors.primary,
 appBarTheme: const AppBarTheme(
  backgroundColor: AppColors.primary,
  centerTitle: true,
  ),
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      displayLarge: boldStyle(color: AppColors.black),
      displayMedium: regularStyle(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
               style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
               ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(color: AppColors.gray)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(color: AppColors.gray)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(color: AppColors.gray)),
      hintStyle:boldStyle(color: AppColors.grayText,fontsize: 16),
     
      
      
      
      
      )
  );
}