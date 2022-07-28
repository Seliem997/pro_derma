import 'package:flutter/material.dart';
import 'package:pro_derma/layout/cubit/cubit.dart';
import 'package:pro_derma/shared/components/components.dart';
import 'package:pro_derma/shared/components/constants.dart';
import 'package:pro_derma/shared/network/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/navigate.dart';
import '../../../shared/styles/colors.dart';
import '../../login/login_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/editProfile.png',
                height: 8.h,
                width: 8.w,
                fit: BoxFit.contain,
              ),
            ),
            verticalSpace(1.8),

            /// Profile Name
            Center(child: Text('Adom Shafi')),
            //  SizedBox(height: KSize.geHeight(context, 10)),

            /// Profile Edit
            Center(
                child: Text('Edit Profile')),
            verticalSpace(4),
            Text('Name'),
            verticalSpace(1),

            /// Name TextField
            buildTextField(nameController),
            verticalSpace(3),
            Text('Your Email'),
            verticalSpace(1),

            /// Email TextField
            Container(
                height: 5.2.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: KColor.lightGrayy),
                    color: KColor.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                  EdgeInsets.only(left: 2.h),
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                        )),
                  ),
                )),
            verticalSpace(3),
            Text('Password'),
            verticalSpace(1),

            /// Enter Password TextField
            Container(
                height: 5.2.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: KColor.lightGrayy),
                    color: KColor.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                  EdgeInsets.only(left: 2.h),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                        )),
                  ),
                )),
            verticalSpace(5),

          ],
        ),
      ),
    );
  }

}
