import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/modules/login/cubit/states.dart';

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
        loginModel = LoginModel.fromJason(value.data);
        print(loginModel.status);
        print(loginModel.message);
        print(loginModel.data?.token);
        print(value);
        emit(LoginSuccessState(loginModel));
      },
    ).catchError(
      (onError) {
        print(onError.toString());
        print('error');
        emit(
          LoginErrorState(onError.toString()),
        );
      },
    );
  }

  IconData suffixPasswordVisible= Icons.visibility_outlined ;
  bool isPassword= true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffixPasswordVisible = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(LoginPasswordVisibilityState());
  }
}
