
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro_derma/layout/cubit/cubit.dart';
import 'package:pro_derma/modules/login/cubit/cubit.dart';
import 'package:pro_derma/modules/login/login_view.dart';

import '../../modules/login/login_screen.dart';
import '../network/local/cache_helper.dart';
import 'navigate.dart';

void signOut(context){
  CacheHelper.removeData(key: 'Email');
  CacheHelper.removeData(key: 'user_name');
  CacheHelper.removeData(key: 'phone');
  CacheHelper.removeData(key: 'token').then((value) {
    if (value){
      navigateAndFinish(context, const LoginView(),);
    }
  });
  LoginCubit.get(context).logOut();
}

bool isDarkMode= false;

String? userName= CacheHelper.returnData(key: 'user_name');
String? userEmail= CacheHelper.returnData(key: 'Email');
String? userPhone= CacheHelper.returnData(key: 'phone');

final User socialUser= FirebaseAuth.instance.currentUser!;

String languageCode = CacheHelper.returnData(key: 'lang');

