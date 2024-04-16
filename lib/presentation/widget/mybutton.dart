// ignore_for_file: sort_child_properties_last

import 'package:chef_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key, this.height=48,required this.width, required this.onPressed, this.background, required this.text, this.textcolor,
  });
final double ?height;
final double ?width;
final VoidCallback onPressed;
final Color? background;
final String text;
final Color ?textcolor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!.h,
      width: width!.w,
      
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith
        (backgroundColor: MaterialStateProperty.all(background??AppColors.primary)),
        child: Text(text,
      
      style: Theme.of(context).textTheme.displayLarge!.copyWith(color:textcolor??AppColors.black,fontSize: 24),),
      
      onPressed: onPressed,),
    );
  }
}