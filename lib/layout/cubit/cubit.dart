import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/cubit/states.dart';

import '../../modules/favorites/favorite_view.dart';
import '../../modules/home/home_view.dart';
import '../../modules/settings/settings_view.dart';
import '../../shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 1;

  List<Widget> bottomScreens=[
    const HomeView(),
    const FavoriteView(),
    const SettingsView(),
  ];

  void changeBottom(int index){

    currentIndex = index;

    emit(AppChangeBottomState());
  }

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


}