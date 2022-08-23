
import 'package:pro_derma/modules/login/login_view.dart';

import '../../modules/login/login_screen.dart';
import '../network/local/cache_helper.dart';
import 'navigate.dart';

void signOut(context){
  CacheHelper.removeData(key: 'Email');
  CacheHelper.removeData(key: 'user_name');
  CacheHelper.removeData(key: 'token').then((value) {
    if (value){
      navigateAndFinish(context, const LoginView(),);
    }
  });
}

bool isDarkMode= false;
