import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
          child: Text(
            'Favorite Screen',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
