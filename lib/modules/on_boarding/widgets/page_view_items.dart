import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/components.dart';
import 'on_boarding_item_model.dart';

Widget buildPageViewItem(BuildContext context,OnBoardingItemsModel model) {
  return Column(
    children: [
      verticalSpace(4),
      SizedBox(
        height: 65.h,
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      Text(
        model.textTitle,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      verticalSpace(1),
      Text(
        model.textBody,
        style: TextStyle(
          fontSize: 17.sp,
        ),
      ),
    ],
  );
}
