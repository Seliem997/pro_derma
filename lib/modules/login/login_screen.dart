import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/app_layout_view.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/default_buttons.dart';
import '../../shared/components/navigate.dart';
import '../../shared/components/show_toast.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colors.dart';
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
            if (state.loginModel.status!=200) {
              // if (kDebugMode) {
              //   print(state.loginModel.message);
              // }
              if (kDebugMode) {
                print(state.loginModel.data!.token);
              }
              // showToast(
              //     message: state.loginModel.message!,
              //     state: ToastStates.success);

              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                token = state.loginModel.data!.token;
                navigateAndFinish(context, const AppLayoutView());
              });
            } else {
              if (kDebugMode) {
                // print(state.loginModel.message);
              }
              // showToast(message: state.loginModel.message!, state: ToastStates.error);
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
                      Text(
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
                      verticalSpace(8),
                      defaultFormField(
                        label: 'Email Address',
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        prefixIcn: Icons.email_outlined,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'PLease, Enter Email address first';
                          }
                          return null;
                        },
                      ),
                      verticalSpace(5),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: 'Enter Password',
                        isPassword: LoginCubit.get(context).isPassword,
                        prefixIcn: Icons.lock_outlined,
                        suffixIcn:
                            LoginCubit.get(context).suffixPasswordVisible,
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
                      verticalSpace(5),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            showToast(message: 'message', state: ToastStates.error);  //*************************-----------------------**************************

                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          textData: 'Login',
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      verticalSpace(7),
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
