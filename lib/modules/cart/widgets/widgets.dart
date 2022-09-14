import 'package:flutter/material.dart';
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
                      icon: Icon(Icons.add),
                      onPressed: (){},
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.minimize),
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

cartListView(width, height) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    width: width,
    height: height / 5.2,
    // color: Colors.blue,
    child: Row(
      children: [
        Container(
          // color: Colors.green,
          width: width / 2.8,
          height: height / 5.7,
          child: Stack(clipBehavior: Clip.none,
              children: [
            Positioned(
              top: 20,
              left: 10,
              child: Container(
                width: width / 3.6,
                height: height / 7.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[400],
                ),
              ),
            ),
            Positioned(
                right: 13,
                bottom: 25,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-30 / 360),
                  child: Container(
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
                'Item Name',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "\$100",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      /*setState(() {
                        bgmodel.numOfShoe--;
                        bagModels.remove(bgmodel);
                        numOfItems = bagModels.length;
                      });*/
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Center(
                          child: Icon(
                            Icons.remove,
                            size: 15,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
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
                      child: Center(
                          child: Icon(
                            Icons.add,
                            size: 15,
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
