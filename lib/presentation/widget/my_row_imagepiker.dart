import 'package:chef_app/utilities/colors.dart';

import 'package:flutter/material.dart';
import 'package:chef_app/presentation/widget/mysizedbox.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustomRow extends StatelessWidget {
   CoustomRow({
    super.key, required this.icon, required this.string, required this.ontap, required this.fontStyle,
  });
final IconData icon;
final String string;
final FontStyle fontStyle;
final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
             Icon(
            icon,
              color: AppColors.primary,
             size: 35,
            ),
             SizedBox_width(
              width: 20.w,
            ),
            Text(
            string,
               style: Theme.of(context).textTheme.displayMedium!.copyWith(fontStyle: fontStyle)
            ),
          ],
        ),
      ),
    );
  }
}
