import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/cubit/states.dart';
import 'package:pro_derma/modules/splash/widgets/splash_screen.dart';
import 'package:pro_derma/shared/network/local/cache_helper.dart';
import 'package:pro_derma/shared/network/remote/dio_helper.dart';
import 'package:pro_derma/shared/styles/themes.dart';
import 'package:sizer/sizer.dart';

import 'layout/cubit/cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              home: const SplashScreen(),
            );
          }
        );
        },
      ),
    );
  }
}

