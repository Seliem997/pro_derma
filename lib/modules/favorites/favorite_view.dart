import 'package:flutter/material.dart';
import 'package:pro_derma/modules/favorites/widgets/favorite_screen.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const FavoriteScreen(),
    );
  }
}
