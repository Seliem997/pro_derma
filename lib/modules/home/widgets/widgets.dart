
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/default_buttons.dart';

Widget serviceItem(BuildContext context, {
  required String text,
  required String assetsImageCat,
  required GestureTapCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Image(
          image:AssetImage("assets/images/$assetsImageCat.png"),
          fit: BoxFit.fitWidth,
          height: 7.h,
        ),
        Container(
          width: 37.w,
          height: 4.5.h,
          margin: EdgeInsetsDirectional.only(end: 4.w,top: 1.h),
          decoration: BoxDecoration(
            color: const Color(0xFFEFA006).withOpacity(0.79),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Center(
            child: buildTextHeader(
              text: text,
              fontSize: 14.sp,
              color: Colors.white,
              isBold: false,
            ),
          ),
        ),
      ],
    ),
  );
}

// Container buildCarouselSliderItem({required String assetsImage,required String text}) {
//   return Container(
//     decoration: BoxDecoration(
//         image: DecorationImage(
//           image:AssetImage("assets/images/$assetsImage.png"),
//           fit: BoxFit.cover,
//         ),
//         borderRadius: BorderRadius.circular(30)),
//     child: Center(child: Padding(
//       padding: EdgeInsetsDirectional.only(start: 3.w),
//       child: buildTextHeader(text: text,),
//     )),
//   );
// }
Container buildCarouselSliderItem({
  required Color color,
  required String imageName,
  required String textHeader,
  required String textBody,
  required VoidCallback onTap,
}) {
  return Container(
    height: 22.h,
    padding: EdgeInsetsDirectional.fromSTEB(4.w, 2.h, 0, 0),
    margin: EdgeInsets.symmetric(horizontal: 1.w),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextHeader(
                text: textHeader,
                fontSize: 16.sp,
                color: Colors.white,
              ),
              verticalSpace(.5),
              buildTextBody(
                text: textBody,
                fontSize: 11.sp,
                maxLines: 2,
                isOverflew: true,
                color: Colors.white,
                isCenter: false,
              ),
              verticalSpace(1),
              FittedBox(
                child: defaultButton(
                  function: onTap,
                  textData: 'Show Details',
                  height: 5.h,
                  width: 50.w,
                  backgroundButton: Colors.white,
                  isUpperCase: false,
                  radius: 16,
                  textSize: 12.sp,
                  buttonTextColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
       Expanded(
         flex: 3,
         child: Padding(
           padding: const EdgeInsets.all(12.0),
           child: Image(
             image: AssetImage(imageName),
             height: 18.h,
               fit: BoxFit.contain,
           ),
         ),
       ),
      ],
    ),
  );
}