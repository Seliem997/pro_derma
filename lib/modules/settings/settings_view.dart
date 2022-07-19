
import 'package:flutter/material.dart';
import 'package:pro_derma/modules/settings/widgets/change_dialog.dart';
import 'package:pro_derma/modules/settings/widgets/widgets.dart';
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
          verticalSpace(5),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: buildTextHeader(text: 'Settings'),
          ),

          verticalSpace(3),
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
            },),
          verticalSpace(3),
        ],
      ),
    );
  }


}
