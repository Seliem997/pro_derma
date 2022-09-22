import 'package:flutter/material.dart';
import 'package:pro_derma/models/cart_model.dart';
import 'package:pro_derma/modules/cart/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/default_buttons.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key,required this.cartModel}) : super(key: key);

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   height: 5.h,
        //   width: 50.w,
        //   color: Colors.pink,
        //   child: GestureDetector(
        //     onTap: (){
        //       signOut(context);
        //     },
        //     child: Text(
        //       'Cart Screen',
        //       style: TextStyle(
        //         fontSize: 20.sp,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 10.h,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  'My Bag items =',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const Spacer(),
                Text(
                  '${cartModel.data.length}',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
        ),
        verticalSpace(1),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 2.w,right: 2.w,),
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
                return cartItem(context,cartModel.data[index]);
                // return buildCartItem(context);
              },
              itemCount: cartModel.data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

            ),
          ),
        ),
        verticalSpace(1),
        SizedBox(
          height: 10.h,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total :',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    verticalSpace(0.5),
                    const Text(
                      '325.7\$'
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 60.w,
                  child: DefaultGradientButton(
                    function:(){} ,
                    text: 'Payment',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
