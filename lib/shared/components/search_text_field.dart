import 'package:flutter/material.dart';
import 'package:pro_derma/shared/styles/colors.dart';
import 'package:sizer/sizer.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, required this.about}) : super(key: key);
  final String about;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onSaved: (value) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
            hintText: "Search $about",
            hintStyle: TextStyle(
              color: kDefaultColor.withOpacity(.7),
              fontSize: 10.sp,
            ),
            hoverColor: kDefaultColor.withOpacity(.06),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
            ),
        ),
      ),
    );
  }
}