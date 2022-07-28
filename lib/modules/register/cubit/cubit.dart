import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/modules/register/cubit/states.dart';

import '../../../models/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;

  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String password,
  }){

    emit(RegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data: {
        'username' : name,
        'email' : email,
        'phone' : phone,
        'password' : password,
      },
    ).then((value) {
      if (kDebugMode) {
        print('data used in register is =>');
        print(value.data);
      }
      loginModel = LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel));

    }).catchError((error){
      if (kDebugMode) {
        print('error in cubit in user register is =>');
        print(error.toString());
      }
      emit(RegisterErrorState(error.toString()));

    });
  }

  IconData suffixPasswordVisible= Icons.visibility_outlined ;
  bool isPassword= true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffixPasswordVisible = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(RegisterChangePasswordVisibilityState());
  }

}