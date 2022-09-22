import 'package:flutter/material.dart';
import 'package:pro_derma/layout/cubit/cubit.dart';
import 'package:pro_derma/models/cart_model.dart';
import 'package:pro_derma/shared/network/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';

Container buildCartItem(BuildContext context) {
  return Container(
    height: 20.h,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
    padding: EdgeInsets.all(4.w),
    decoration: BoxDecoration(
      color: KColor.lightBlue.withOpacity(0.5),
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 25.w,
          child: Image.network('https://img.freepik.com/premium-photo/cosmetic-tube-with-moisturizer-cream_160204-3939.jpg?w=740'),
         
         /* child: Image(
            image: AssetImage(model.desc!),
            // image: AssetImage('assets/images/on_boarding2.jpg'),
            fit: BoxFit.cover,
          ),*/
        ),
        horizontalSpace(2),
        Expanded(
          child: Column(
            children: [
              Text(
                'Name of item',
                style: Theme.of(context).textTheme.subtitle2,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(2),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Price : ',
                      style: Theme.of(context).textTheme.bodyText1!
                          .copyWith(color: KColor.lightness,fontSize: 16.sp)),
                  TextSpan(
                      text: '30\$',
                      // text: '${model.price}\$',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp)),
                ]),
              ),
            ],
          ),
        ),
        horizontalSpace(2),
        IconButton(
          onPressed: (){},
          icon: const CircleAvatar(
            radius: 25,
            backgroundColor: KColor.red,
            child: Icon(
              Icons.remove_shopping_cart_outlined,
            ),
          ),
        ),

      ],
    ),
  );
}

Widget buildCartCard(){
  return Stack(
    clipBehavior: Clip.none,
    children: [
      SizedBox(
        height: 30.h,
        width: 47.w,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hand Bag LV',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),

                verticalSpace(1),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'$25',
                      style: TextStyle(
                        color: KColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: (){},
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.minimize),
                    )
                  ],
                ),
                verticalSpace(1),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'$25',
                      style: TextStyle(
                        color: KColor.blue,
                        fontSize: 15.sp,
                      ),
                    ),
                    const Icon(
                      Icons.remove_shopping_cart_outlined,
                      color: KColor.red,
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 11.h,
        left: 10.w,
        child: Image.network(
          'https://o.remove.bg/downloads/0450a006-b266-42fe-be94-d191966e03cd/pngtree-3d-realistic-cosmetic-mockup-design-png-image_2864119-removebg-preview.png',
          height: 15.h,
        ),
      ),
    ],
  );
}

cartItem(context,CartData model) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
    padding: EdgeInsets.only(top: 1.h),
    height: 20.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(2, 2),
        ),
      ],
    ),
    // color: Colors.blue,
    child: Row(
      children: [
        SizedBox(
          // color: Colors.green,
          width: 33.w,
          height: 21.h,
          child: Stack(clipBehavior: Clip.none,
              children: [
            Positioned(
              top: 20,
              left: 10,
              child: Container(
                width: 27.w,
                height: 14.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[400],
                ),
              ),
            ),
            const Positioned(
                right: 13,
                bottom: 20,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-30 / 360),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image(
                      image: AssetImage(
                        'assets/images/on_boarding1.png',
                      ),
                    ),
                  ),
                ))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.product!,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
             verticalSpace(0.3),
              Text(
                model.productId!,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color:  Colors.black,
                ),
              ),
              verticalSpace(.5),
              Text(
                'total = ${int.parse(model.productId!)*int.parse(model.quantity!)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color:  Colors.black,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical:3.h ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: const Center(
                      child: Icon(
                        Icons.remove,
                        size: 15,
                      )),
                ),
              ),
              Text(
                model.quantity!,
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 15,
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
