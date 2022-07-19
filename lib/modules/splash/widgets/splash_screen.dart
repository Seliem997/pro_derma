
import 'package:flutter/material.dart';
import 'package:pro_derma/modules/on_boarding/on_boarding_view.dart';

import '../../../shared/components/navigate.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), (){
      navigateAndFinish(context, const OnBoardingView());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/logo.png'),
    );
  }

}
