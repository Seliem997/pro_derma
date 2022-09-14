import 'package:flutter/material.dart';
import 'package:pro_derma/modules/cart/widgets/widgets.dart';
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
          height: 5.h,
          width: 50.w,
          color: Colors.pink,
          child: GestureDetector(
            onTap: (){
              signOut(context);
            },
            child: Text(
              'Cart Screen',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        verticalSpace(5),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 5.h),
            // child: GridView.builder(
            //   clipBehavior: Clip.none,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     childAspectRatio: 1.2,
            //     crossAxisSpacing: 0,
            //     mainAxisSpacing: 5.h,
            //   ),
            //   itemBuilder: (context, index){
            //     return buildCartCard();
            //   },
            // ),
            child: ListView.builder(
              itemBuilder: (context, index){
                return cartListView(100.w,100.h);
              },

            ),
          ),
        ),
      ],
    );
  }
}
