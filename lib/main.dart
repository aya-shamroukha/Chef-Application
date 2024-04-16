import 'package:chef_app/config/theme.dart';
import 'package:chef_app/data/localSotrge/localStorage.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/reset_password_bloc/resetpassword_bloc.dart';
import 'package:chef_app/presentation/bloc/auth_bloc/login_bloc/login_bloc.dart';

import 'package:chef_app/presentation/bloc/auth_bloc/sendcode_bloc/bloc/sendcode_bloc.dart';
import 'package:chef_app/presentation/bloc/bloc_observer.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/add_meal_bloc/add_meal_bloc.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/delete_meal_bloc/delete_meal_bloc.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/get_meal_bloc/get_meals_bloc.dart';
import 'package:chef_app/presentation/bloc/menu_bloc/get_meal_bloc/get_meals_event.dart';
import 'package:chef_app/presentation/bloc/profile_bloc/change_password/bloc/change_password_bloc.dart';

import 'package:chef_app/presentation/bloc/profile_bloc/update_profile/bloc/update_profile_bloc.dart';
import 'package:chef_app/presentation/pages/auth/change_lang.dart';
import 'package:chef_app/presentation/pages/auth/login_screen.dart';
import 'package:chef_app/presentation/pages/auth/reset_password.dart';
import 'package:chef_app/presentation/pages/auth/send_code.dart';
import 'package:chef_app/presentation/pages/auth/splash_screen.dart';
import 'package:chef_app/presentation/pages/home_screen.dart';
import 'package:chef_app/presentation/pages/menu/add_meal.dart';
import 'package:chef_app/presentation/pages/menu/menu_home.dart';
import 'package:chef_app/presentation/pages/profile/change_password.dart';
import 'package:chef_app/presentation/pages/profile/update_profile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initgetit();
  getIt.get<SharedPreferences>().getString(
        'languagecode',
      );

  runApp(EasyLocalization(
      path: "assets/translation",
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
        BlocProvider(create: (context) => LoginBloc()),
      BlocProvider(create: (context) => SendcodeBloc()),
       BlocProvider(create: (context) => SendcodeBloc()),
       BlocProvider(create: (context) => AddMealBloc()),
    BlocProvider(create: (context) => ResetpasswordBloc()),
     BlocProvider(create: (context) => DeleteMealBloc()),
     BlocProvider(create: (context) => GetMealsBloc()..add(GetMealSuccessEvent())),
      BlocProvider(create: (context) => UpdateProfileBloc()),
       BlocProvider(create: (context) => ChangePasswordBloc()),
      ],
            child: MaterialApp(
                theme: appTheme(),
                // routerDelegate: router.routerDelegate,
                //     routeInformationParser: router.routeInformationParser,
                //     routeInformationProvider: router.routeInformationProvider,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                home: const SplashScreen(),
                routes: {
                  'login': (context) => const Login(),
                  'splash': (context) => const SplashScreen(),
                  'sendcode': (context) => const SendCodeScreen(),
                  'changelan': (context) => const ChangeLangScreen(),
                  'addmeal': (context) => const AddMealScreen(),
                  'resetpassword': (context) => const ResetPassword(),
                    'homescreen': (context) => const HomeScreen(),
                    'menuScreen':(context)=>const MenuHomeScreen(),
                    "updateProfileScreen":(context)=>const UpdateProfileScreen(),
                    "changePassword":(context)=>const ChangePassword()
                }),
          );
        });
  }
}
