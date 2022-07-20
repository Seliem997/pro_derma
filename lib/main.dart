import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/app_layout_view.dart';
import 'package:pro_derma/layout/cubit/states.dart';
import 'package:pro_derma/modules/on_boarding/on_boarding_view.dart';
import 'package:pro_derma/modules/splash/widgets/splash_screen.dart';
import 'package:pro_derma/shared/network/local/cache_helper.dart';
import 'package:pro_derma/shared/network/remote/dio_helper.dart';
import 'package:pro_derma/shared/styles/themes.dart';
import 'package:sizer/sizer.dart';

import 'layout/cubit/cubit.dart';
import 'modules/login/login_screen.dart';
import 'shared/components/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  DioHelper.init();

  String? onBoarding = CacheHelper.returnData(key: 'onBoarding');
  token = CacheHelper.returnData(key: 'token') ;
  print('onBoarding in main from cache is $onBoarding');
  print('token in main from cache is $token');
  Widget startWidget;
  if( onBoarding != null ){
    if(token != null ){
      startWidget = const AppLayoutView();
      print('taken in main != null $token');
    }else{
      startWidget = const LoginScreen();
      print('onBoarding in main != null ');
    }
  }else{
    startWidget = const OnBoardingView();
    print('onBoarding in main = null ');
  }

  runApp( MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp(this.startWidget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('start widget is  $startWidget');
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state){},
        builder: (context, state) {
          return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              // home: const Tests(),
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

