import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pro_derma/modules/login/cubit/states.dart';

import '../../../layout/cubit/states.dart';
import '../../../models/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;

  void userLogin({required String email, required String password,}) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then(
      (value) {
        loginModel = LoginModel.fromJson(value.data);
        print('login status code in cubit = ');
        print(loginModel.status);
        print('login model taken in cubit = ');
        print(loginModel.data?.token);
        print('login value in cubit = ');
        print(value);
        emit(LoginSuccessState(loginModel));
      },
    ).catchError(
      (onError) {
        print(onError.toString());
        print('error in user login');
        emit(
          LoginErrorState(onError.toString()),
        );
      },
    );
  }
/*

  //--------------------------------- Google Sign in -------

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async{
    final googleUser = await googleSignIn.signIn();
    if(googleUser == null) return;

    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    emit(SignInGoogleState());

  }
*/

  IconData suffixPasswordVisible= Icons.visibility_outlined ;
  bool isPassword= true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffixPasswordVisible = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(LoginPasswordVisibilityState());
  }
}
