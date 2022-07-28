import 'package:flutter/material.dart';
import 'package:pro_derma/shared/components/components.dart';
import 'package:pro_derma/shared/components/default_buttons.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(5),
            Center(
              child: Image.asset(
                'assets/images/editProfile.png',
                height: 20.h,
                width: 33.w,
                fit: BoxFit.contain,
              ),
            ),
            verticalSpace(1),

            /// Profile Name
            Center(
                child: Text(
                  'Mostafa Selim',
                  style: TextStyle(
                      fontSize: 16.sp
                  ) ,
            )),

            /// Profile Edit
            Center(
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: kDDefaultGreyColor,
                    fontSize: 12.sp
                  ) ,
                ),
            ),
            verticalSpace(4),
            const Text('Name'),
            verticalSpace(1),
            /// Name TextField
            buildTextField(nameController,'Enter Name',context),
            verticalSpace(3),
            const Text('Your Email'),
            verticalSpace(1),
            /// Email TextField
            buildTextField(emailController,'Enter Email',context),
            verticalSpace(3),
            const Text('Phone'),
            verticalSpace(1),
            /// Enter Phone TextField
            buildTextField(phoneController,'Enter Phone',context),
            verticalSpace(5),
            defaultButton(
              function: (){},
              textData: 'Save Now',
              isUpperCase: false,
            ),

          ],
        ),
      ),
    );
  }

}
