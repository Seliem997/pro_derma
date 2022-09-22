import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/cubit/cubit.dart';
import 'package:pro_derma/modules/cart/widgets/cart_screen.dart';

import '../../layout/cubit/states.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: ConditionalBuilder(
              condition: AppCubit.get(context).cartModel != null,
              builder: (context){
                return CartScreen(
                  cartModel: AppCubit.get(context).cartModel!,
                );
              },
              fallback: (context) => const Center(child: CircularProgressIndicator(),),
            ),
          );
        },
      ),
    );
  }
}
