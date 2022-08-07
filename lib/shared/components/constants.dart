
import '../../modules/login/login_screen.dart';
import '../network/local/cache_helper.dart';
import 'navigate.dart';

void signOut(context){
  CacheHelper.removeData(key: 'token').then((value) {
    if (value){
      navigateAndFinish(context, const LoginScreen(),);
    }
  });
}

// String? token;

bool isDarkMode= false;