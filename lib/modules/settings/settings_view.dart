import 'package:flutter/material.dart';
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            middleDashbord(),
            verticalSpace(3),
            buildGeneralSettings(context),
            const Divider(
              thickness: 1,
              color: kDefaultSecondColor,
            ),
            verticalSpace(.5),
            buildTextBody(text: 'version : 1.0.1'),
            // const Spacer(),
            DefaultGradientButton(
              text: 'Company Profile',
              function: () {
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
              }
              ,
            ),
          ],
        ),
      ),
    );
  }

}
