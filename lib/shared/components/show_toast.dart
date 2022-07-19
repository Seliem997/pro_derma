
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String message,
  required ToastStates state,
}) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.green,
    textColor: chooseToastColor(state),
    fontSize: 16.0
);

enum ToastStates {success, error, warning}

Color? chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.warning:
      color = Colors.amberAccent;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
  }
  return color;
}