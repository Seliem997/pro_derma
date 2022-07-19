
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,

            onTap: (index) {
              cubit.changeBottom(index);
            },
            items: const [

              BottomNavigationBarItem(
                icon: Icon(
                  Icons.info_outline_rounded,
                ),
                label: 'favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    Icons.settings,
                ),
                // label: translator.translate('settings'),
                label: 'settings',
              ),

            ],
          ),
        ) ;
      },
    );
  }
}
