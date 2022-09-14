import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pro_derma/layout/cubit/states.dart';
import 'package:pro_derma/models/home_model.dart';
import 'package:pro_derma/modules/cart/cart_view.dart';
import 'package:pro_derma/modules/favorite/favorite_view.dart';
import 'package:pro_derma/shared/network/end_points.dart';
import 'package:pro_derma/shared/network/remote/dio_helper.dart';
import 'package:sizer/sizer.dart';

import '../../models/login_model.dart';
import '../../modules/home/home_view.dart';
import '../../modules/profile/profile_view.dart';
import '../../modules/settings/settings_view.dart';
import '../../shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

//-------------------------------------------- Create Navigation Bar --------------------
  int currentIndex = 0;

  List<Widget> bottomScreens=[
    const HomeView(),
    const FavoriteView(),
    const CartView(),
    const ProfileView(),
    const SettingsView(),
  ];

  void changeBottom(int index){

    currentIndex = index;

    emit(AppChangeBottomState());
  }

//-------------------------------------------- changeSideBarDrawer -------

  double xOffset= 0;
  double yOffset= 0;
  bool isDrawerOpen= false;

  void changeSideBarDrawer(){
    if(isDrawerOpen){
      xOffset= 0;
      yOffset= 0;
      isDrawerOpen= false;
      emit(AppChangeDrawerState());
    }else{
      xOffset = 100.w - 120;
      yOffset = 100.h /5;
      isDrawerOpen = true;
      emit(AppChangeDrawerState());
    }
  }
//---------------------------------------------- Change App Mode To Dark Mode -------------
  bool isDark = false;

  void changeAppMode({bool? modeFromShared}){

    if(modeFromShared != null){
      isDark = modeFromShared;
      emit(AppChangeModeState());
    }else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDarkMode', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }

  }
//-------------------------------------------- Get Data Of Product in Home Screen -------

  HomeModel? homeModel;
void getHomeData({String? userToken}){
    emit(AppLayoutLoadingState());

    DioHelper.getData(url: HOME,token: userToken)
        .then((value) {
          homeModel = HomeModel.fromJson(value.data);
          print('homeModel.toString()${homeModel.toString()}');
          print('homeModel!.dataModel[0].title${homeModel!.dataModel[0].title}');
          print('value.data${value.data}');
          print('value.data.toString()${value.data.toString()}');
          emit(AppLayoutSuccessStates());

    }).catchError((error){
      print('error in get home Data => ${error.toString()}');
      emit(AppLayoutErrorState(error.toString()));
    });
}

//-------------------------------------------- Add products To Cart  -------


void addProductsToCart({int? productId,String? userToken}){
    emit(AppAddToCartLoadingState());

    DioHelper.getData(url: '$ADDTOCART/$productId',token: userToken)
        .then((value) {

          print('Added To Cart Successfully');
          print('value.data${value.data}');
          print('value.data.toString()${value.data.toString()}');
          emit(AppAddToCartSuccessStates());

    }).catchError((error){
      print('error in add to cart  => ${error.toString()}');
      emit(AppAddToCartErrorState(error.toString()));
    });
}

}