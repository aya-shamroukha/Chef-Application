import 'package:chef_app/presentation/pages/menu/menu_home.dart';
import 'package:chef_app/presentation/pages/profile/profile_home.dart';
import 'package:chef_app/utilities/colors.dart';
import 'package:chef_app/utilities/string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
      int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
      var screen=[const ProfileHomeScreen(),const MenuHomeScreen(),];
    return  Scaffold(
      body: screen[selectedindex],
      bottomNavigationBar: GNav(
        activeColor: AppColors.primary,
        gap: 8,
        tabBackgroundColor: AppColors.grayText.withOpacity(0.7),
        tabBorderRadius: 25,
        padding: const EdgeInsets.all(10),
        iconSize: 28,
        tabMargin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        onTabChange: (index){
       setState(() {
selectedindex=index;
         
       });
            
     
        },
        selectedIndex: selectedindex,
        tabs: [
          GButton(icon: Icons.person_outline,text: AppStrings().profile.tr()),
          GButton(icon: Icons.menu,text: AppStrings().menu.tr()),
        ],
      ),
    );
  }
}
