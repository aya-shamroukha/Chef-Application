
import 'package:chef_app/presentation/widget/mysizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ShimmerBodyForImageMenu extends StatelessWidget {
  const ShimmerBodyForImageMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 80.w,
      decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(12)),
    );
  }
}
class ShimmerBodyForMenu extends StatelessWidget {
  const ShimmerBodyForMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       //crossAxisAlignment: CrossAxisAlignment.,
       children: [
       Container(
         height: 80.h,
         width: 80.w,
         decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(30)),
       ),
                         //const  SizedBox_width(width: 20,),
       Expanded(child: Column(children: [
         Container(height: 20.h,width: 240.w,
         decoration:  BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(4)),),
              SizedBox_Height(height: 8.h,),
          Container(height: 20.h,width: 240.w,
         decoration:  BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(4)),),
                                            SizedBox_Height(height: 8.h,),

          Container(height: 20.h,width: 240.w,
         decoration:  BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(4)),),
        
       ],))
                              ],),
    );
  }
}