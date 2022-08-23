import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: kLightGreyColor,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black26,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: kDefaultColor,
      size: 14,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: kDefaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 44.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF1A191D),
    ),
    headline2: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF1A191D),
    ),
    headline3: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF1A191D),
    ),
    subtitle1: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF1A191D),
    ),
    subtitle2: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF1A191D),
    ),
    bodyText1: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF1A191D),
    ),
    bodyText2: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF1A191D),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  primarySwatch: Colors.blue,
  fontFamily: 'Airbnb',

);

ThemeData darkTheme= ThemeData(
  scaffoldBackgroundColor: kDefaultNightModeColor,
  // colorScheme: const ColorScheme.dark(),
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: kDefaultNightModeColor,
      // statusBarColor: Color(0xFF3A3B3C) ,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
    ),
    // backgroundColor: Colors.transparent,
    backgroundColor: Color(0xFF3A3B3C),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: kDefaultColor,
      size: 18,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: kDefaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.red,

  ),

  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF1A191D),
    ),
      subtitle1: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  primarySwatch: Colors.blue,
  fontFamily: 'Airbnb',

);