import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
              'Favorite Screen',
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
      ],
    );
  }
}
