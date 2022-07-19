
import 'package:flutter/material.dart';
import 'package:pro_derma/modules/on_boarding/on_boarding_view.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/components.dart';
import '../../shared/components/navigate.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 3.w,end: 3.w,top: 2.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(1.5),
                Row(
                  children: [
                    buildTextHeader(text: 'Services'),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        navigateTo(context, const OnBoardingView());
                      },
                      child: buildTextBody(
                        text: 'See all',
                      ),
                    ),
                    // horizontalSpace(2),
                  ],
                ),
                verticalSpace(1),
                buildTextHeader(text: 'Popular'),
                verticalSpace(1),

                // buildRequestServiceList(),
                // const Expanded(
                //   child: TabBarDemo(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

