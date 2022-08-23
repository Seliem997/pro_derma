import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/app_layout_view.dart';
import 'package:pro_derma/layout/cubit/states.dart';
import 'package:pro_derma/modules/login/login_view.dart';
import 'package:pro_derma/modules/on_boarding/on_boarding_view.dart';
import 'package:pro_derma/shared/network/local/cache_helper.dart';
import 'package:pro_derma/shared/network/remote/dio_helper.dart';
import 'package:pro_derma/shared/styles/themes.dart';
import 'package:sizer/sizer.dart';

import 'layout/cubit/cubit.dart';
import 'modules/login/login_screen.dart';
import 'shared/components/constants.dart';

void main(context) async{
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  DioHelper.init();

  await Firebase.initializeApp();

  bool? darkFromShared = CacheHelper.returnData(key: 'isDarkMode');
  if(darkFromShared != null){
    isDarkMode = darkFromShared;
  }

  String? onBoarding = CacheHelper.returnData(key: 'onBoarding');
  String? mainToken = CacheHelper.returnData(key: 'token') ;
  print("tToken From shared is $mainToken");
  Widget startWidget;
  if( onBoarding != null ){
    if(mainToken != null ){
      startWidget = const AppLayoutView();
    }else{
      startWidget = const LoginView();
    }
  }else{
    startWidget = const OnBoardingView();
  }

  runApp( MyApp(startWidget,isDarkMode,tokenMain: mainToken,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool isDarkMode;
  final String? tokenMain;

  const MyApp(this.startWidget,this.isDarkMode, {Key? key,this.tokenMain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..changeAppMode(modeFromShared: isDarkMode)/*..getHomeData(userToken: tokenMain)*/,
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
              // home: const AppLayoutView(),
              // home: const RegisterScreen(),
              // home: const SplashScreen(),
              // home: onBoarding ? const LoginScreen() : const OnBoardingView(),
              home: startWidget,
            );
          }
        );
        },
      ),
    );
  }
}

