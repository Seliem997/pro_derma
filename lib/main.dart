import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/app_layout_view.dart';
import 'package:pro_derma/layout/cubit/states.dart';
import 'package:pro_derma/modules/on_boarding/on_boarding_view.dart';
import 'package:pro_derma/shared/network/local/cache_helper.dart';
import 'package:pro_derma/shared/network/remote/dio_helper.dart';
import 'package:pro_derma/shared/styles/themes.dart';
import 'package:sizer/sizer.dart';

import 'layout/cubit/cubit.dart';
import 'modules/login/login_screen.dart';
import 'modules/splash/widgets/splash_screen.dart';
import 'shared/components/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  DioHelper.init();

  bool isDarkMode = CacheHelper.returnData(key: 'isDarkMode');

  String? onBoarding = CacheHelper.returnData(key: 'onBoarding');
  token = CacheHelper.returnData(key: 'token') ;
  Widget startWidget;
  if( onBoarding != null ){
    if(token != null ){
      startWidget = const AppLayoutView();
    }else{
      startWidget = const LoginScreen();
    }
  }else{
    startWidget = const OnBoardingView();
  }

  runApp( MyApp(startWidget,isDarkMode));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool isDarkMode;

  const MyApp(this.startWidget,this.isDarkMode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..changeAppMode(modeFromShared: isDarkMode)..getHomeData(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state){},
        builder: (context, state) {
          return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: const AppLayoutView(),
              // home: const SplashScreen(),
              // home: onBoarding ? const LoginScreen() : const OnBoardingView(),
              // home: startWidget,
            );
          }
        );
        },
      ),
    );
  }
}

