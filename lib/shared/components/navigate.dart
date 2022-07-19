
import 'package:flutter/material.dart';

navigateTo(context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ));
}

navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => widget,
    ),
        (Route<dynamic> route) => false,
  );
}
