import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(
    {required Color color,
    required double fontsize,
    required FontWeight fontWeight}) {
  return GoogleFonts.lato(
    color: color,
    fontSize:fontsize.sp,
    fontWeight:fontWeight
    );
}
//bold style
TextStyle boldStyle(  
  { Color color=Colors.white,
     double fontsize=24,
    })=> textStyle(color: color, 
fontsize: fontsize, 
fontWeight: FontWeight.bold);
//regular style
TextStyle regularStyle(  
  { Color color=Colors.black,
     double fontsize=16,
    })=> textStyle(color: color, 
fontsize: fontsize, 
fontWeight: FontWeight.normal);