import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 3.w, end: 3.w, top: 2.h, bottom: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextHeader(text: 'Popular'),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        '75%',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      verticalSpace(2),
                      const Text(
                        '75%',
                      ),

                      verticalSpace(2),
                      const Text('data'),
                      verticalSpace(2),
                      const Text('data'),
                      verticalSpace(2),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 5,
                  child: Image(
                    image: AssetImage('assets/images/on_boarding1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 20.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.red,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(1, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 25.w,
                  child: const Image(
                    image: AssetImage('assets/images/on_boarding2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(2),
                Expanded(
                  child: Text(
                    'Bottle 80ml Used for serums, creams and lotions.',
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                horizontalSpace(2),
                const Icon(Icons.favorite_border_rounded),
              ],
            ),
          ),
          // verticalSpace(2),
        ],
      ),
    );
  }
}
