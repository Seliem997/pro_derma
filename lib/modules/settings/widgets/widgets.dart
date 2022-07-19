import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/styles/colors.dart';

Padding buildItemGeneralSettings({
  required String title,
  required GestureTapCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 8.h,
        decoration: BoxDecoration(
          color: kDefaultColor.withOpacity(0.06),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
              ),

            ],
          ),
        ),
      ),
    ),
  );
}
//
// class ItemWithDropDown extends StatefulWidget {
//   const ItemWithDropDown({Key? key, required this.title, this.items,required this.selectedItems}) : super(key: key);
//     final String title;
//     final String selectedItems;
//     final items;
//
//   @override
//   _ItemWithDropDownState createState() => _ItemWithDropDownState();
// }
//
// class _ItemWithDropDownState extends State<ItemWithDropDown> {
//   final String title;
//   String selectedItems;
//   final items;
//
//   _ItemWithDropDownState({required this.title, this.items,required this.selectedItems });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Container(
//         height: 10.h,
//         decoration: BoxDecoration(
//           color: kDefaultColor.withOpacity(0.06),
//           borderRadius: BorderRadius.circular(40),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Row(
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const Spacer(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: DropdownButton<String>(
//                   // items: appearance.map(buildMenuItem).toList(),
//                   // onChanged: (value) => setState(() {
//                   //   this.value=value;
//                   // }),
//                   // value: value,
//                   items: items.map((String mode) => DropdownMenuItem(
//                     child: Text(mode,),
//                     value: mode,
//                   )).toList(),
//                   onChanged: (String? valueMode) {
//                     setState(() {
//                       selectedItems = valueMode!;
//                     });
//                   },
//                   value: selectedItems,
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
