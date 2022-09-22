import 'package:flutter/material.dart';
import 'package:pro_derma/modules/login/cubit/cubit.dart';
import 'package:pro_derma/modules/side_bar_drawer/widgets/drawer_items.dart';
import 'package:pro_derma/shared/components/components.dart';
import 'package:sizer/sizer.dart';

import '../../layout/cubit/cubit.dart';
import '../../shared/components/constants.dart';
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
                      radius: 40,
                      child: Icon(Icons.person,color: Colors.white,size: 10.w),
                    ),
                    verticalSpace(2),
                    Text(
                      // CacheHelper.returnData(key: 'user_name'),
                      userName==null ? socialUser.displayName! : userName!,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                      ),
                    ),
                    verticalSpace(1),
                    Text(
                      // CacheHelper.returnData(key: 'Email'),
                      userEmail==null ? socialUser.email! : userEmail!,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: KColor.grayishBlue,
                      ),
                    ),
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
                  itemTextName: 'Settings',
                  onTap: (){
                    AppCubit.get(context).changeBottom(4);
                    AppCubit.get(context).changeSideBarDrawer();
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                AppCubit.get(context).changeSideBarDrawer();
                AppCubit.get(context).changeBottom(0);
                signOut(context);
              },
              child: Row(
                children: [
                  const Icon(Icons.logout),
                  horizontalSpace(2),
                  Text(
                      'Log out',
                      style: Theme.of(context).textTheme.subtitle1
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

