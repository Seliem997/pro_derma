
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/components.dart';



Widget popularItemsList(BuildContext context, index,{required GestureTapCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.w,
          height: 25.h,
          margin: EdgeInsetsDirectional.only(end: 4.w),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/popularImage[index].png',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        verticalSpace(2),
        SizedBox(
          width: 41.w,
          child: buildTextHeader(
            text: 'popularHeader[index]',
            fontSize: 13.5.sp,
          ),
        ),
        verticalSpace(1),
        SizedBox(
          width: 35.w,
          child: buildTextBody(
            text: 'popularBody[index]',
            isCenter: false,
            maxLines: 3,
            isOverflew: true,
          ),
        ),
      ],
    ),
  );
}
