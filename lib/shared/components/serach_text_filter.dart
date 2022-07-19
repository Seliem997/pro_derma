
import 'package:flutter/material.dart';
import 'package:pro_derma/shared/components/search_text_field.dart';
import 'package:pro_derma/shared/styles/colors.dart';
import 'package:sizer/sizer.dart';

import 'components.dart';

class SearchWithFilter extends StatelessWidget {
  const SearchWithFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 7.0.h,
          width: 70.w,
          decoration: BoxDecoration(
              color: kDefaultColor.withOpacity(0.09),
              borderRadius: BorderRadius.circular(30)),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 3.w),
              child: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ),
            // Container(
            //     height: 5.h,
            //     width: 5.h,
            //     padding: EdgeInsets.all(1.h),
            //     margin: EdgeInsets.only(left: 1.5.h),
                // child: Image.asset("assets/images/search_icon.png"),
            // ),
            const SearchTextField(about: 'Services',),
            horizontalSpace(2.5.w),
            Container(
              width: 7.h,
              height: 6.h,
              // padding: EdgeInsets.all(2.5.h),
              decoration: BoxDecoration(
                  color: kDefaultColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(30)),
              child: Image.asset("assets/icons/filter1.png"),
            ),
          ],
        ),
      ],
    );
  }
}

//
// Widget searchTextFilter({
//   required TextEditingController controller,
//   required String label,
// }){
//   return Row(
//     children: [
//       Container(
//         height: 7.0.h,
//         width: 67.w,
//         decoration: BoxDecoration(
//             color: kDefaultColor.withOpacity(0.06),
//             borderRadius: BorderRadius.circular(3.h),
//         ),
//         child: defaultFormField(
//           controller: controller,
//           type: TextInputType.text,
//           label: label,
//           prefixIcn: Icons.search,
//           iconColor: kDefaultColor,
//           border: const OutlineInputBorder(borderSide: BorderSide.none),
//           validate: (value) {
//             if (value.isEmpty){
//               return 'Value must not be empty!';
//             }
//             return null;
//           },
//         ),
//       ),
//     ],
//   );
// }