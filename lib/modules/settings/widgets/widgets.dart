import 'package:flutter/material.dart';
import 'package:pro_derma/layout/cubit/cubit.dart';
import 'package:pro_derma/modules/settings/widgets/repeated_list.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import 'change_dialog.dart';

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

middleDashbord() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Dashboard",
        style: const TextStyle(
            fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 15),
      ),
      verticalSpace(2),
      RoundedLisTile(
        onTap: (){},
        leadingBackColor: Colors.green[600],
        icon: Icons.wallet_travel_outlined,
        title: "Payments",
        trailing: Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue[700],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "2 New",
                style: TextStyle(
                    color: kDefaultLightColor, fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: kDefaultLightColor,
                size: 15,
              )
            ],
          ),
        ),
      ),
      RoundedLisTile(
        onTap: (){},
        leadingBackColor: Colors.yellow[600],
        icon: Icons.archive,
        title: "Achievments",
        trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_forward_ios,
                color: kDefaultNightModeColor,
                size: 15,
              )
            ],
          ),
        ),
      ),
      RoundedLisTile(
       onTap: (){},
        leadingBackColor: Colors.grey[400],
        icon: Icons.shield,
        title: "Privacy",
        trailing: Container(
          width: 140,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red[500],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Action Needed  ",
                style: TextStyle(
                    color: kDefaultLightColor, fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: kDefaultLightColor,
                size: 15,
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Column buildGeneralSettings(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'General',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      verticalSpace(2),
      RoundedLisTile(
        onTap: (){},
        leadingBackColor: Colors.black38,
        icon: Icons.light_mode,
        title: 'Dark mode',
        // trailing: Container(
        //   width: 30,
        //   height: 30,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: const [
        //       Icon(
        //         Icons.arrow_forward_ios,
        //         color: kDefaultNightModeColor,
        //         size: 15,
        //       )
        //     ],
        //   ),
        // ),
        trailing: Switch.adaptive(
          value: AppCubit.get(context).isDark,
          onChanged: (value){
            AppCubit.get(context).changeAppMode();

        },
        ),
      ),
      buildItemGeneralSettings(
        title: 'Change Language',
        onTap:
            () {
                  showDialog(
                    context: context,
                    builder: (_) => const DialogChangeLanguage(),
                  );
                }
        ,
      ),
      verticalSpace(.5),
    ],
  );
}
