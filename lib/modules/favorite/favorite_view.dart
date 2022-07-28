import 'package:flutter/material.dart';
import 'package:pro_derma/modules/favorite/widgets/favorite_screen.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoriteScreen(),
    );
  }
}
