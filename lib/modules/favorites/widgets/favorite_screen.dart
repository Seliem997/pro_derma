import 'package:flutter/material.dart';
import 'package:pro_derma/shared/network/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/components/navigate.dart';
import '../../login/login_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20.h,
          width: 30.w,
          color: Colors.pink,
          child: GestureDetector(
            onTap: (){
              CacheHelper.removeData(key: 'token').then((value) {
                if (value){
                  navigateAndFinish(context, const LoginScreen(),);
                }
              });
              print('token in favorite screen is $token');
            },
            child: Text(
              'Favorite Screen',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
