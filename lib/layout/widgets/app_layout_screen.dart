
import 'dart:math';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../shared/network/local/cache_helper.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class AppLayoutScreen extends StatelessWidget {
  const AppLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state) => {},
      builder: (context, state) {

        var cubit=AppCubit.get(context);
        List<String> titles =[
          'Pro Derma',
          'Favorites',
          'Cart',
          'Profile',
          'Settings'
        ];

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(cubit.xOffset, cubit.yOffset, 0)
          ..scale(cubit.isDrawerOpen ? 0.90 : 1.00)
          ..rotateZ(cubit.isDrawerOpen ? pi/20 : 0),
          // decoration: BoxDecoration(
          //   color: Colors.red,
          //   borderRadius: cubit.isDrawerOpen ? BorderRadius.circular(200) :  BorderRadius.circular(0),
          //
          // ),

          child: Scaffold(

            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  cubit.changeSideBarDrawer();
                },
                icon: Icon(Icons.menu,size: 18.sp),
              ),
              title: Text(
                titles[cubit.currentIndex],
                style: const TextStyle(
                  fontFamily: 'Poppins',
                    fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500
                ),
              ),
              centerTitle: true,

            ),

            body: cubit.bottomScreens[cubit.currentIndex],

            bottomNavigationBar: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                child: DotNavigationBar(
                  itemPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  marginR: const EdgeInsets.symmetric(horizontal: 15),
                  backgroundColor: Colors.black,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  currentIndex: AppCubit.get(context).currentIndex,
                  dotIndicatorColor: Colors.blue,
                  unselectedItemColor: Colors.blueGrey,
                  onTap: (index) {
                    AppCubit.get(context).changeBottom(index);
                  },
                  items: [
                    DotNavigationBarItem(
                      icon: const Icon(Icons.home_outlined),
                      selectedColor: Colors.white,
                    ),
                    DotNavigationBarItem(
                      icon: const Icon(Icons.favorite_border_rounded),
                      selectedColor: Colors.white,
                    ),
                    DotNavigationBarItem(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      selectedColor: Colors.white,
                    ),
                    DotNavigationBarItem(
                      icon: const Icon(Icons.person_outline_rounded),
                      selectedColor: Colors.white,
                    ),
                    DotNavigationBarItem(
                      icon: const Icon(Icons.settings_outlined),
                      selectedColor: Colors.white,
                    ),

                  ],
                ),
              ),
            ),

          ),
        ) ;
      },
    );
  }
}

// bottomNavigationBar: BottomNavigationBar(
//   currentIndex: cubit.currentIndex,
//
//   onTap: (index) {
//     cubit.changeBottom(index);
//   },
//   items: const [
//
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.info_outline_rounded,
//       ),
//       label: 'favorite',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.home,
//       ),
//       label: 'home',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//           Icons.settings,
//       ),
//       // label: translator.translate('settings'),
//       label: 'settings',
//     ),
//
//   ],
// ),

