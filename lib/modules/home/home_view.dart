import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/cubit/states.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../layout/cubit/cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colors.dart';
import 'widgets/home_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState(){
    super.initState();
    if(AppCubit.get(context).homeModel == null){
      AppCubit.get(context).getHomeData(userToken: CacheHelper.returnData(key: 'token'));
    }
  }

  @override

  Widget build(BuildContext context) {
    // var listController = PageController();
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     SmoothPageIndicator(
      //       controller: listController,
      //       count: 10,
      //   effect: const ScrollingDotsEffect(
      //     activeStrokeWidth: 2.6,
      //     activeDotScale: 1.3,
      //     maxVisibleDots: 5,
      //     radius: 8,
      //     spacing: 10,
      //     dotHeight: 12,
      //     dotWidth: 12,
      //   ),
      //       // effect: ExpandingDotsEffect(
      //       //   activeDotColor: kDefaultColor,
      //       //   dotColor: Colors.orange.shade200,
      //       //   dotHeight: 10,
      //       //   dotWidth: 10,
      //       //   expansionFactor: 4,
      //       //   spacing: 2.w,
      //       // ),
      //     ),
      //   ],
      // ),
      // body: ListView.builder(
      //   physics: const BouncingScrollPhysics(),
      //     controller: listController,
      //     itemBuilder: (context,index){
      //       // return SizedBox(
      //       //   width: 95.w,
      //       //   height: 85.h,
      //       //   child: HomeScreen(),
      //       // );
      //       return ConstrainedBox(
      //           constraints: BoxConstraints(
      //             minWidth: 95.w,
      //             minHeight: 60.h,
      //             maxHeight: 70.h,
      //             maxWidth: 99.w,
      //           ),
      //           child: HomeScreen());
      //       // return UnconstrainedBox(
      //       //
      //       //   child: LimitedBox(
      //       //       maxWidth: 90.w,
      //       //       maxHeight: 80.h,
      //       //       child: HomeScreen()),
      //       // );
      // },
      //     // separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.red,),
      //     itemCount: 3,
      //   scrollDirection: Axis.horizontal,
      // ),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit= AppCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.homeModel != null,
            builder: (context) {
              // return PageView.builder(
              //   physics: const BouncingScrollPhysics(),
              //   controller: listController,
              //   itemBuilder: (context, index) => const HomeScreen(),
              //   itemCount: 10,
              //   onPageChanged: (int index) {},
              // );
              return HomeScreen(homeModel : cubit.homeModel!);
            },
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
          );
        }
      ),
    );
  }
}

