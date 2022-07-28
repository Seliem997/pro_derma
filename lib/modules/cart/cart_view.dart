import 'package:flutter/material.dart';
import 'package:pro_derma/modules/cart/widgets/cart_screen.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartScreen(),
    );
  }
}
