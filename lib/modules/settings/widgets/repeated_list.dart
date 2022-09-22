// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pro_derma/shared/styles/colors.dart';
import 'package:sizer/sizer.dart';

class RoundedLisTile extends StatelessWidget {
  GestureTapCallback onTap;
  Color? leadingBackColor;
  IconData icon;
  String title;
  Widget trailing;

  RoundedLisTile({
    required this.onTap,
    required this.leadingBackColor,
    required this.icon,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Container(
          width: 100.w,
          height: 7.2.h,
          child: ListTile(
              leading: CircleAvatar(
                backgroundColor: leadingBackColor,
                radius: 25,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    icon,
                    color: kDefaultLightColor,
                  ),
                ),
              ),
              title: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kDefaultNightModeColor,
                    fontSize: 18),
              ),
              trailing: trailing),
        ),
      ),
    );
  }
}
