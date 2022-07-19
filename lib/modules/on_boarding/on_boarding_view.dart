import 'package:flutter/material.dart';
import 'package:pro_derma/modules/on_boarding/widgets/on_boarding_screen.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingScreen(),
    );
  }
}
