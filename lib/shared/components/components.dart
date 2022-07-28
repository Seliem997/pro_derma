import 'package:flutter/material.dart';
import 'package:pro_derma/shared/styles/colors.dart';
import 'package:sizer/sizer.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefixIcn,
  required FormFieldValidator validate,
  Function(dynamic)? onSubmit,
  // Function(dynamic)? onChange,
  // GestureTapCallback? tap,
  bool isPassword = false,
  IconData? suffixIcn,
  VoidCallback? suffixPressed,
  InputBorder? border,
  Color iconColor = kDefaultColor,
}) =>
//     TextFormField(
//   controller: controller,
//   keyboardType: type,
//   onFieldSubmitted: onSubmit,
//   onChanged: onChange,
//   onTap: tap,
//   validator: validate,
//   obscureText: isPassword,
//   decoration: InputDecoration(
//     filled: true,
//     fillColor: Colors.white,
//     contentPadding: EdgeInsetsDirectional.only(start: 5.w, bottom: 2.h),
//     labelText: label,
//     labelStyle: TextStyle(color: kDefaultColor.withOpacity(.6)),
//     prefixIcon: Icon(
//       prefixIcn,
//       color: iconColor,
//     ),
//     suffixIcon: suffixIcn != null
//         ? IconButton(
//       onPressed: suffixPressed,
//       icon: Icon(
//         suffixIcn,
//       ),
//     )
//         : null,
//     border: border ??
//         OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
//     /*enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide.none,
//         ),
//         contentPadding:const EdgeInsets.symmetric(vertical: 15, horizontal: 20),*/
//   ),
// );
    TextFormField(
      keyboardType: type,
      controller: controller,
      onFieldSubmitted: onSubmit,
      // onChanged: onChange,
      // onTap: tap,
      validator: validate,
      obscureText: isPassword,
      style: TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          prefixIcn,
          color: iconColor,
        ),
        suffixIcon: suffixIcn != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcn,
                  color: iconColor,
                ),
              )
            : null ,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius:BorderRadius.circular(25),

        ),
        border: OutlineInputBorder(
            borderRadius:BorderRadius.circular(25)
        ),

        contentPadding:
            const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
        hintText: label,
        hintStyle: TextStyle(
          color: KColor.tertiary,
          fontSize: 12.sp,
          fontFamily: 'Poppins',
        ),
      ),
    );

Widget verticalSpace(double height) => SizedBox(
      height: height.h,
    );
Widget horizontalSpace(double width) => SizedBox(
      width: width.w,
    );

Text buildTextHeader({
  required String text,
  Color? color,
  double? fontSize,
  bool isBold = true,
}) {
  return Text(
    text,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontSize: fontSize ?? 20.sp,
      fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'poppins',
      letterSpacing: 1.0,
    ),
  );
}

Text buildTextBody({
  required String text,
  Color? color,
  double? fontSize,
  int? maxLines,
  bool isOverflew = false,
  bool? isCenter,
}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: isOverflew ? TextOverflow.ellipsis : null,
    textAlign: isCenter == null ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      color: color ?? Colors.blueGrey,
      fontSize: fontSize ?? 12.sp,
    ),
  );
}

Container buildTextField(TextEditingController nameController,String hintText,context) {
  return Container(
      height: 5.6.h,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: KColor.lightGrayy),
          color: KColor.white,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
        EdgeInsets.only(left: 3.w,top:2.5.h),
        child: TextField(
          style: const TextStyle(fontWeight: FontWeight.w500),
          controller: nameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyText1),
        ),
      ));
}


// Column buildRequestServiceSheet(BuildContext context) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       buildTextHeader(text: 'Request Service',fontSize: 18.sp,color: kDefaultBlackColor,),
//       verticalSpace(2.5),
//       // buildContactWay(
//       //   textWayName: 'Whatsapp',
//       //   imageWay: 'whatsapp',
//       //   textWayValue: '01069500944',
//       //   labelName: 'Contact',
//       //   iconWay: const Icon(Icons.send),
//       //   function: () {
//       //     openWhatsapp(context);
//       //   },
//       //   backgroundButton: Colors.green,
//       // ),
//       verticalSpace(2.5),
//       // buildContactWay(
//       //   textWayName: 'Phone',
//       //   imageWay: 'phone',
//       //   textWayValue: '01029994052',
//       //   labelName: 'Call now',
//       //   iconWay: const Icon(Icons.local_phone_sharp,),
//       //   function: ()async {
//       //     launch('tel://+201029994052');
//       //   },
//       //   backgroundButton: kDefaultColor,
//       // ),
//     ],
//   );
// }
/*

PreferredSizeWidget defaultAppBar({
  required context,
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    title: Text(
      title,
    ),
    actions: actions,
  );
}
*/


Widget? widget;
