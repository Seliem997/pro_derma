
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
  Function(dynamic)? onChange,
  GestureTapCallback? tap,
  bool isPassword= false,
  IconData? suffixIcn,
  VoidCallback? suffixPressed,
  InputBorder? border,
  Color? iconColor,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: tap,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(start: 10.w,bottom: 5.h),
        labelText: label,
        labelStyle: TextStyle(color: kDefaultColor.withOpacity(.6)),
        prefixIcon: Icon(
          prefixIcn,
          color: iconColor,
        ),
        suffixIcon: suffixIcn!=null ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffixIcn,
          ),
        ) : null ,
        border: border?? OutlineInputBorder(borderRadius: BorderRadius.circular(25)) ,
      ),
    );

Widget verticalSpace(double height) => SizedBox(height: height.h,);
Widget horizontalSpace(double width) => SizedBox(width: width.w,);


Text buildTextHeader({required String text, Color? color,double? fontSize,bool isBold = true,}) {
  return Text(
    text,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontSize: fontSize ?? 20.sp ,
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
    overflow: isOverflew? TextOverflow.ellipsis : null,
    textAlign: isCenter==null ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      color: color ?? Colors.blueGrey,
      fontSize: fontSize ?? 12.sp,
    ),
  );
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



PreferredSizeWidget defaultAppBar({
  required context,
  required String title,
  List<Widget>? actions,
}){
  return AppBar(
    title: Text(
      title,
    ),
    actions: actions,
  );
}



Widget? widget;
