
import 'package:flutter/material.dart';
import 'package:pro_derma/modules/splash/widgets/splash_screen.dart';

import '../../shared/styles/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDefaultColor,
      body: SplashScreen(),
    );
  }
}
