
import 'package:flutter/material.dart';
import 'package:pro_derma/models/home_model.dart';
import 'package:pro_derma/modules/details/details_view.dart';
import 'package:pro_derma/shared/components/navigate.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';



Container buildPopularItemList(BuildContext context,DataProductsModel model) {
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
          child: Image(
            image: AssetImage(model.desc!),
            // image: AssetImage('assets/images/on_boarding2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        horizontalSpace(2),
        Expanded(
          child: Column(
            children: [
              Text(
                model.title!,
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
                        text: '${model.price}\$',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp)),
                  ]),
              ),
            ],
          ),
        ),
        horizontalSpace(2),
        IconButton(
          onPressed: (){
            print(model.id);
            navigateTo(context, DetailsView());
          },
          icon: const CircleAvatar(
            radius: 15,
            backgroundColor: KColor.green,
            child: Icon(
              Icons.add_shopping_cart,
            ),
          ),
        ),

      ],
    ),
  );
}

// Build Category item to Draw  --***--***--***************------------------*****************-

Container buildCategoryItemList() {
  return Container(
    width: 40.w,
    height: 18.h,
    margin: EdgeInsetsDirectional.only(end: 4.w),
    decoration: BoxDecoration(
      image: const DecorationImage(
        image: AssetImage(
          'assets/images/on_boarding2.jpg',
        ),
        fit: BoxFit.fill,
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
  );
}