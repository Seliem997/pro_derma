import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/app_layout_view.dart';
import 'package:pro_derma/layout/cubit/app_layout_screen.dart';
import 'package:pro_derma/shared/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/components.dart';
import '../../shared/components/default_buttons.dart';
import '../../shared/components/navigate.dart';
import '../../shared/components/show_toast.dart';
import '../../shared/network/local/cache_helper.dart';
import '../register/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status == 200) {
              if (kDebugMode) {
                print('token in login success when code 200 is =');
                print(state.loginModel.data!.token);
              }
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                // token = state.loginModel.data!.token;
                showToast(message: 'Login Success', state: ToastStates.success);
                navigateAndFinish(context, const AppLayoutView());
              });
            } else {
              showToast(message: state.loginModel.message!, state: ToastStates.error);
              if (kDebugMode) {
                print('Code error number is ');
                print(state.loginModel.status);
              }
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*Text(
                        'Hello Again!',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(3),
                      Text(
                        'Login now to browse our hot offer',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.grey),
                      ),
                      verticalSpace(8),*/
                      verticalSpace(6),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w,bottom: 2.h),
                        child: Text(
                          'Welcome Back!',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Text('Fill your details or continue',
                            style: Theme.of(context).textTheme.subtitle1!
                                .copyWith(
                                fontSize: 17.sp,
                                height: 1.8,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins',
                            ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Text('with social media...',
                            style: Theme.of(context).textTheme.subtitle1!
                                .copyWith(
                                height: 1.5,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins',
                            ),
                        ),
                      ),
                      verticalSpace(6),
                      defaultFormField(
                        label: 'Email Address',
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        prefixIcn: Icons.email_outlined,
                        iconColor: KColor.primary,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'PLease, Enter Email address first';
                          }
                          return null;
                        },
                      ),
                      verticalSpace(3),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: 'Enter Password',
                        isPassword: LoginCubit.get(context).isPassword,
                        prefixIcn: Icons.lock_outlined,
                        suffixIcn: LoginCubit.get(context).suffixPasswordVisible,
                        iconColor: KColor.primary,
                        suffixPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Password must not be empty';
                          }
                          return null;
                        },
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                      verticalSpace(1.5),
                      Align(
                          alignment: Alignment.topRight,
                          child: Text(
                              'Forget Password?',
                              style: Theme.of(context).textTheme.caption,
                          ),
                      ),
                      verticalSpace(3),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            isUpperCase: false,
                            textData: 'Login',
                            height: 6.h,
                            backgroundButton: KColor.primary,
                          ),
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      verticalSpace(5),
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
                      verticalSpace(3),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account ?',
                          ),
                          verticalSpace(5),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, const RegisterScreen());
                            },
                            child: const Text(
                              'REGISTER!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
