import 'package:flutter/material.dart';
import 'package:pro_derma/layout/cubit/cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/network/local/cache_helper.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          topInformationwidget(),
          midelImgListWidget(),
          SizedBox(
            height: 20,
            width:90.w,
            child: const Divider(
              thickness: 1.4,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            //color: Colors.red, just for debuging
            child: Column(
              children: [
                nameAndPrice(),
                const SizedBox(height: 10),
                shoeInfo(),
                const SizedBox(
                  height: 5,
                ),
                moreDetailsText(),
                quantitiesText(),
                quantities(),
                const SizedBox(
                  height: 20,
                ),
                materialButton(onPressed: (){
                  AppCubit.get(context)
                      .addProductsToCart(
                        productId: 2,
                        userToken: CacheHelper.returnData(key: 'token'),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Top information Widget Components
  topInformationwidget() {
    return SizedBox(
      height: 40.h,
      child: Stack(
        children: [
          Positioned(
            left: 50,
            bottom: 20,
            child:  Container(
                width: 100.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(1500),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
          ),
          Positioned(
            top: 7.h,
            left: 20.w,
            // child: RotationTransition(
            //   turns: const AlwaysStoppedAnimation(22 / 360),
            //   child: SizedBox(
            //     width: 50.w,
            //     height: 25.h,
            //     child: const Image(image: AssetImage('assets/images/on_boarding2.jpg')),
            //   ),
            // ),
            child:  SizedBox(
                width: 50.w,
                height: 25.h,
                child: const Image(image: AssetImage('assets/images/on_boarding2.jpg')),
            ),
          )
        ],
      ),
    );
  }

// Middle Imagw List Widget Components
  midelImgListWidget() {
    return Container(
        padding: const EdgeInsets.all(2),
        height: 11.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            roundedimag(),
            roundedimag(),
            roundedimag(),
            Container(
              padding: const EdgeInsets.all(2),
              width: 20.w,
              height: 11.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: const AssetImage('assets/images/black_pump.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(1), BlendMode.darken),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      );
  }


  // Rounded Image Widget About Below Methode Components
  roundedimag() {
    return Container(
      padding: const EdgeInsets.all(2),
      width: 20.w,
      height: 11.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: const Image(
        image: AssetImage('assets/images/on_boarding1.png'),
      ),
    );
  }


  //Name And Price Text Components
  nameAndPrice() {
    return Row(
        children: [
          const Text(
            'Pump Foam',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Expanded(child: Container()),
          const Text(
            '\$47',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
        ],
      );
  }

  //About Shoe Text Components
  shoeInfo() {
    return SizedBox(
        height: 13.h,
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt laoreet enim, eget sodales ligula semper at. Sed id aliquet eros, nec vestibulum felis. Nunc maximus aliquet aliquam. Quisque eget sapien at velit cursus tincidunt. Duis tempor lacinia erat eget fermentum.",
          style: TextStyle(color: Colors.grey[600]),
        ),
      );
  }


  //more detailes Text Components
  moreDetailsText() {
    return Container(
        padding: const EdgeInsets.only(right: 260),
        height: 5.h,
        child: const FittedBox(
            child: Text(
              'MORE DETAILS',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  height: 1,
              ),
            ),
        ),
      );
  }

  //MaterialButton Components
  materialButton({VoidCallback? onPressed}) {
    return MaterialButton(
        minWidth: 90.w,
        height: 7.h,
        color: Colors.amberAccent,
        onPressed: onPressed,
        child: const Text(
          "ADD TO Cart",
          style: TextStyle(color: Colors.red),
        ),
      );
  }

  //end section quantities And Button numbers

  quantities() {
    final List<int> quantities = [200,500,1000,2000,5000];
    return SizedBox(
      height: 6.h,
      child: Row(
          children: [
            Container(
              width: 25.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1)),
              child: const Center(
                child: Text(
                  "Type it",
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          width:22.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black,
                                width: 1.5),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              quantities[index].toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
    );
  }

  //quantities Text
  quantitiesText() {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        "quantities",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.lightBlue,
          fontSize: 22,
        ),
      ),
    );
  }


}

