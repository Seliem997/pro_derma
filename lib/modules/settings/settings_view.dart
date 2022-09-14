
import 'package:flutter/material.dart';
import 'package:pro_derma/modules/settings/widgets/change_dialog.dart';
import 'package:pro_derma/modules/settings/widgets/repeated_list.dart';
import 'package:pro_derma/modules/settings/widgets/settings_screen.dart';
import 'package:pro_derma/modules/settings/widgets/widgets.dart';
import 'package:pro_derma/shared/components/navigate.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/components.dart';
import '../../shared/components/default_buttons.dart';
import '../../shared/styles/colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          middleDashbord(),
          Text(
            'General',
            // textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),

          verticalSpace(5),

          buildItemGeneralSettings(
            title: 'Change appearance',
            onTap: (){
              showDialog(
                context: context,
                builder: (_) => const DialogAppearanceMode(
                 /* functionOne: (){
                    AppCubit.get(context).changeAppMode();
                  },
                  functionTwo: (){},
                  title:  'You want change to $appearanceMode',
                  valueOne: appearanceMode,
                  valueTwo: 'Cancel',*/
                ),
              );
            },
          ),

          buildItemGeneralSettings(
            title: 'Change Language',
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const DialogChangeLanguage(),
              );
            },
          ),

          verticalSpace(5),
          const Divider(thickness: 1,color: kDefaultSecondColor,),
          verticalSpace(5),
          buildTextBody(text: 'version : 1.0.1'),
          const Spacer(),
          DefaultGradientButton(
            text: 'BUY NOW',
            function: (){
              navigateTo(context, const SettingsScreen());
            }
            /*{
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 40.h,
                      decoration: const BoxDecoration(
                        color: kLightGreyColor,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                      ),

                    );
                  });
            }*/,),
          verticalSpace(3),
        ],
      ),
    );
  }

  middleDashbord() {
    return Container(
      width: 100.w,
      height: 40.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "    Dashboard",
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          RoundedLisTile(
            width: 100.w,
            height: 100.h,
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
            width: 100.w,
            height: 100.h,
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
            width: 100.w,
            height: 100.h,
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
      ),
    );
  }

}
