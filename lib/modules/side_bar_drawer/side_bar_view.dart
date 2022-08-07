import 'package:flutter/material.dart';
import 'package:pro_derma/modules/cart/cart_view.dart';
import 'package:pro_derma/modules/favorite/favorite_view.dart';
import 'package:pro_derma/modules/settings/settings_view.dart';
import 'package:pro_derma/modules/side_bar_drawer/widgets/drawer_items.dart';
import 'package:pro_derma/shared/components/components.dart';
import 'package:pro_derma/shared/components/navigate.dart';
import 'package:sizer/sizer.dart';

import '../../layout/cubit/cubit.dart';
import '../../shared/styles/colors.dart';

class SideBarDrawerView extends StatelessWidget {
  const SideBarDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(  //هنا ال column الكبير المحتضن الكل
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(  //هنا بقي العمود الصغير المحتوي علي الصورة والاسم
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person,color: Colors.white,size: 10.w),
                    ),
                    verticalSpace(2),
                    Text('User Name',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                    verticalSpace(1),
                    Text('User_Name@gmail.com',style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.normal,color: KColor.grayishBlue),),
                  ],
                ),
              ),
            ),
            Column(   // هنا بقي العمود المحتوي علي العناصر
              children: [
                ItemDrawer(
                  itemIcon: Icons.add,
                  itemTextName: 'New Item',
                  onTap: (){},
                ),
                verticalSpace(3),
                ItemDrawer(
                  itemIcon: Icons.favorite,
                  itemTextName: 'Favorite',
                  onTap: (){
                    AppCubit.get(context).changeBottom(1);
                    AppCubit.get(context).changeSideBarDrawer();
                  },
                ),
                verticalSpace(3),
                ItemDrawer(
                  itemIcon: Icons.bookmark,
                  itemTextName: 'Cart',
                  onTap: (){
                    AppCubit.get(context).changeBottom(2);
                    AppCubit.get(context).changeSideBarDrawer();
                  },
                ),
                verticalSpace(3),
                ItemDrawer(
                  itemIcon: Icons.settings,
                  itemTextName: 'Setting',
                  onTap: (){
                    AppCubit.get(context).changeBottom(4);
                    AppCubit.get(context).changeSideBarDrawer();
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.logout),
                horizontalSpace(2),
                Text(
                    'Log out',
                    style: Theme.of(context).textTheme.subtitle1
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

