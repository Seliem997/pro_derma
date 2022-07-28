
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class AppLayoutView extends StatelessWidget {
  const AppLayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state) => {},
      builder: (context, state) {

        var cubit=AppCubit.get(context);

        return Scaffold(
          body: cubit.bottomScreens[cubit.currentIndex],
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
          bottomNavigationBar: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: DotNavigationBar(
                marginR: const EdgeInsets.symmetric(horizontal: 15),
                backgroundColor: Colors.black,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                currentIndex: AppCubit.get(context).currentIndex,
                dotIndicatorColor: Colors.transparent,
                unselectedItemColor: Colors.grey,
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
        ) ;
      },
    );
  }
}
