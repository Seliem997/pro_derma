import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/app_layout_view.dart';
import 'package:pro_derma/layout/cubit/app_layout_screen.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/components.dart';
import '../../shared/components/default_buttons.dart';
import '../../shared/components/navigate.dart';
import '../../shared/components/show_toast.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colors.dart';
import '../login/login_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            if( state.loginModel.status == 200){
              if (kDebugMode) {
                print('token in register success when code 200 is =');
                print(state.loginModel.data!.token);
              }
              showToast(message: 'Done', state: ToastStates.success);

              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                // token = state.loginModel.data!.token;
                navigateAndFinish(context, const AppLayoutView());
              });
            }else{
              if (kDebugMode) {
                print('Code error number is ');
                print(state.loginModel.status);
              }
              showToast(message: state.loginModel.message!, state: ToastStates.error);
            }
          }
        },
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(3),
                    Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Text(
                            'Create New Account',
                            style: Theme.of(context).textTheme.headline2!.copyWith(
                                fontWeight: FontWeight.w600),
                        ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 1.w,top: 2.h),
                      child: Text('Register to browse our hot offer',
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              height: 1.8,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                            fontSize: 16.sp
                          ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Text('Or continue with social media...',
                          style: Theme.of(context).textTheme.subtitle1!
                              .copyWith(
                            height: 1.6,
                              fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,

                            // fontSize: 16.sp
                          )),
                    ),
                    verticalSpace(3),

                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      label: 'User Name',
                      prefixIcn: Icons.person,
                      iconColor: KColor.primary,
                      validate: (value){
                        if(value.isEmpty){
                          return 'Name must not be empty';
                        }
                        return null;
                      },
                    ),

                    verticalSpace(2),

                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: 'Email Address',
                      prefixIcn: Icons.email,
                      iconColor: KColor.primary,
                      validate: (value){
                        if(value.isEmpty){
                          return 'Email Address must not be empty';
                        }
                        return null;
                      },
                    ),

                    verticalSpace(2),

                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      label: 'Phone',
                      prefixIcn: Icons.phone,
                      iconColor: KColor.primary,
                      validate: (value){
                        if(value.isEmpty){
                          return 'Phone must not be empty';
                        }
                        return null;
                      },
                    ),

                    verticalSpace(2),

                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: 'Password',
                      prefixIcn: Icons.password,
                      suffixIcn: RegisterCubit.get(context).suffixPasswordVisible,
                      iconColor: KColor.primary,
                      isPassword: RegisterCubit.get(context).isPassword,
                      suffixPressed: (){
                        RegisterCubit.get(context).changePasswordVisibility();
                      },
                      validate: (value){
                        if(value.isEmpty){
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                      onSubmit: (value){
                        if(formKey.currentState!.validate()){
                          RegisterCubit.get(context).userRegister(
                            email : emailController.text,
                            name : nameController.text,
                            phone : phoneController.text,
                            password : passwordController.text,
                          );
                        }
                      }
                    ),

                    verticalSpace(5),

                    ConditionalBuilder(
                      condition: state is! RegisterLoadingState,
                      builder: (context) => defaultButton(
                        function: (){
                          if(formKey.currentState!.validate()){
                            RegisterCubit.get(context).userRegister(
                                name : nameController.text,
                                email : emailController.text,
                                phone : phoneController.text,
                                password : passwordController.text,
                            );
                          }
                        },
                        textData: 'Sign Up',
                        isUpperCase: true,
                        backgroundButton: KColor.primary,
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator()) ,
                    ),
                    verticalSpace(2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/line.png',
                          height: 0.25.h,
                          width: 3.w,
                          fit: BoxFit.cover,
                        ),
                        horizontalSpace(3),
                        const Text('Or Continue With'),
                        horizontalSpace(3),
                        Image.asset(
                          'assets/images/line.png',
                          height: 0.25.h,
                          width: 3.w,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),

                    ///Google FaceBook
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 9.h,
                          width: 12.w,
                          fit: BoxFit.contain,
                        ),
                        horizontalSpace(3),
                        Image.asset(
                          'assets/images/facebook.png',
                          height: 8.h,
                          width: 11.w,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    verticalSpace(3),
                    Center(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          navigateTo(context, const LoginScreen());
                        },
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Already Have Account?',
                                  style: Theme.of(context).textTheme.bodyText1!
                                      .copyWith(color: KColor.tertiary)),
                              TextSpan(
                                  text: ' Log In',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16)),
                            ])),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
