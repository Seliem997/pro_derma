import 'package:flutter/material.dart';
import 'package:pro_derma/modules/login/cubit/cubit.dart';
import 'package:pro_derma/shared/components/components.dart';
import 'package:pro_derma/shared/components/default_buttons.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    var cubit= LoginCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(2),
            Center(
              child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      cubit.user.toString() ==""
                          ? 'https://img.freepik.com/free-photo/3d-rendering-zoom-call-avatar_23-2149556782.jpg?w=740&t=st=1663081245~exp=1663081845~hmac=1f94f7cc06bdcf51b4f3d2c4512cd879915e3706503b7432073d760d823dd335'
                          : cubit.user.photoUrl!,
                  ),
/*
                  backgroundImage: AssetImage('assets/images/editProfile.png'),
*/
                // backgroundImage: socialUser.photoURL == null ? AssetImage('assets/images/editProfile.png') : NetworkImage(socialUser.photoURL!),

              ),
              /*child: Image.asset(
                'assets/images/editProfile.png',
                height: 20.h,
                width: 33.w,
                fit: BoxFit.contain,
              ),*/
            ),
            verticalSpace(1),

            /// Profile Name
            Center(
                child: Text(
                  userName==null ? cubit.user.displayName! : userName!,
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
            buildTextField(nameController,userName==null ? cubit.user.displayName! : userName!,context),
            verticalSpace(3),
            const Text('Your Email'),
            verticalSpace(1),
            /// Email TextField
            // buildTextField(emailController,userEmail==null ? socialUser.email! : userEmail! ,context),
            buildTextField(emailController,userEmail==null ? cubit.user.email : userEmail! ,context),
            verticalSpace(3),
            const Text('Phone'),
            verticalSpace(1),
            /// Enter Phone TextField
           /* buildTextField(
              phoneController,
              userPhone==null ? socialUser.phoneNumber! : userPhone!,
               *//*if(userPhone== null){
                if(socialUser.phoneNumber == null){
                  return 'Enter Your Number';
                }else {
                  return socialUser.phoneNumber!;
                }
              }else{
                return userPhone!
              },*//*
            context,),*/
            verticalSpace(5),
            defaultButton(
              function: (){
                // socialUser.photoURL;
              },
              textData: 'Save Now',
              isUpperCase: false,
            ),
            verticalSpace(3),
            defaultButtonWithIcon(
              onPressed: (){
                signOut(context);
              },
              labelText: 'Log out',
              icon: const Icon(Icons.logout),
              textColor: Colors.red,
              backgroundButton: Colors.transparent
            ),

          ],
        ),
      ),
    );
  }

}
