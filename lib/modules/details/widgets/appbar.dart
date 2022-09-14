// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

PreferredSize? customAppBarDe(ctx) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,

      leading: IconButton(
        onPressed: () {
           Navigator.pop(ctx);
        },
        icon: Icon(Icons.arrow_back,color: Colors.black,),
      ),

    ),
  );
}
