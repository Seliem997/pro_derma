import 'package:flutter/material.dart';
import 'package:pro_derma/shared/components/components.dart';
import 'package:sizer/sizer.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(10),
          Icon(Icons.error_outline_rounded,color: Colors.red,size: 25.sp,),
          verticalSpace(10),
          Text(
            'Something Went Wrong!',
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
