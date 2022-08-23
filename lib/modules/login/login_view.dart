import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro_derma/modules/login/login_screen.dart';
import 'package:pro_derma/shared/components/error_page.dart';
import 'package:pro_derma/shared/components/show_toast.dart';

import '../../layout/app_layout_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot){
      //     if(snapshot.connectionState == ConnectionState.waiting){
      //       return const Center(child: CircularProgressIndicator(),);
      //     } else if(snapshot.hasData){
      //       showToast(message: 'Login Success', state: ToastStates.success);
      //       return const AppLayoutView();
      //     }else if(snapshot.hasError){
      //       showToast(message: 'Wrong', state: ToastStates.error);
      //       return const ErrorPage();
      //     } else{
      //       return const LoginScreen();
      //     }
      //   },
      // ),


      body: LoginScreen(),
    );

  }
}
