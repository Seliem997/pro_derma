import 'package:flutter/material.dart';
import 'package:pro_derma/shared/components/applocal.dart';
import 'package:sizer/sizer.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';

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
              signOut(context);
            },
            child: Text(
              'Favorite ${getLang(context, 'home')}',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        verticalSpace(5),
        IconButton(
          onPressed: (){
            AppCubit.get(context).changeAppMode();
          },
          icon: const Icon(Icons.brightness_4_outlined),
        ),
        verticalSpace(5),
        IconButton(
          onPressed: (){
            // AppCubit.get(context).changeAppMode();
          },
          icon: const Icon(Icons.language),
        ),
      ],
    );
  }
}
