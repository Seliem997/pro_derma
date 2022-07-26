import 'package:flutter/material.dart';

import '../modules/side_bar_drawer/side_bar_view.dart';
import 'widgets/app_layout_screen.dart';

class AppLayoutView extends StatelessWidget {
  const AppLayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          SideBarDrawerView(),
          AppLayoutScreen(),
        ],
      ),
    );
  }
}
