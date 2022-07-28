import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/cubit/states.dart';
import 'package:pro_derma/models/home_model.dart';
import 'package:pro_derma/modules/cart/cart_view.dart';
import 'package:pro_derma/shared/network/end_points.dart';
import 'package:pro_derma/shared/network/remote/dio_helper.dart';

import '../../modules/favorites/favorite_view.dart';
import '../../modules/home/home_view.dart';
import '../../modules/settings/settings_view.dart';
import '../../shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

//-------------------------------------------- Create Navigation Bar --------------------
  int currentIndex = 1;

  List<Widget> bottomScreens=[
    const FavoriteView(),
    const HomeView(),
    const SettingsView(),
    const CartView(),
  ];

  void changeBottom(int index){

    currentIndex = index;

    emit(AppChangeBottomState());
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
  String? dataString;
void getHomeData(){
    emit(AppLayoutLoadingState());

    DioHelper.getData(url: HOME)
        .then((value) {
          // homeModel = HomeModel.fromJson(value.data);
          // print(homeModel.toString());
      dataString = value.data;
      print('response from Api is ${dataString}');
          // print(value.data.toString());
          emit(AppLayoutSuccessStates());

    }).catchError((error){
      print('error in get home Data${error.toString()}');
      emit(AppLayoutErrorState(error.toString()));
    });
}

}