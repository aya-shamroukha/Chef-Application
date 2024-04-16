import 'package:chef_app/presentation/widget/my_row_imagepiker.dart';
import 'package:chef_app/presentation/widget/mysizedbox.dart';
import 'package:chef_app/utilities/colors.dart';
import 'package:chef_app/utilities/string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            SizedBox_Height(height: 47.h),
            SizedBox(width: 113.w, height: 113.h, child: CircleAvatar(

              backgroundColor: AppColors.primary,
            )),
            Text(
              'aya sh',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox_Height(height: 14.h),
            Text(
              'email.com',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox_Height(height: 32.h),
            Padding(
              padding: const EdgeInsets.all(24),
              child: CoustomRow(
                icon: Icons.person,
                string: AppStrings().editprofile.tr(),
                ontap: () {
                  Navigator.of(context).pushNamed('updateProfileScreen');
                },
                fontStyle: FontStyle.normal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
              child: CoustomRow(
                icon: Icons.visibility_off,
                string: AppStrings().password.tr(),
                ontap: () {
                  Navigator.of(context).pushNamed('changePassword');
                },
                fontStyle: FontStyle.normal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
              child: CoustomRow(
                icon: Icons.settings,
                string: AppStrings().setting.tr(),
                ontap: () {},
                fontStyle: FontStyle.normal,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
                child: CoustomRow(
                  icon: Icons.logout,
                  string: AppStrings().logout.tr(),
                  ontap: () {},
                  fontStyle: FontStyle.normal,
                ))
          ],
        )),
      ),
    );
  }
}
