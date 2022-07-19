import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../shared/components/default_buttons.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/styles/colors.dart';

class DialogAppearanceMode extends StatefulWidget {
  // final String title;
  // final String valueOne;
  // final String valueTwo;
  /*final VoidCallback functionOne;
  final VoidCallback functionTwo;*/


  const DialogAppearanceMode(
      {Key? key,
        // required this.title, required this.valueOne, required this.valueTwo,/* required this.functionOne, required this.functionTwo*/
      }) : super(key: key);


  @override
  State<StatefulWidget> createState() => DialogAppearanceModeState(/*valueOne: valueOne,title: this.title, valueTwo: valueTwo,*//*functionOne: functionOne,functionTwo: functionTwo*/);
}

class DialogAppearanceModeState extends State<DialogAppearanceMode>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  // String title;
  // String valueOne;
  // String valueTwo;
  // /*VoidCallback functionOne;
  // VoidCallback functionTwo;*/

  DialogAppearanceModeState(/*{*//*required this.title,required this.valueOne,required this.valueTwo,*//**//*required this.functionOne,required this.functionTwo*//*}*/);

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    String appearanceMode= AppCubit.get(context).isDark ? 'Night mode' : 'Light mode' ;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: buildDialogContainer(
            title: 'You want change to $appearanceMode',
            valueOne: appearanceMode,
            valueTwo: 'Cancel',
          ),
        ),
      ),
    );
  }

  Container buildDialogContainer({required String title,required String valueOne,required String valueTwo,}) {
    return Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(15.0),
            height: 30.h,
            decoration: ShapeDecoration(
                // color: const Color.fromRGBO(41, 167, 77, 10),
                color: kDefaultLightColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 20.0, right: 20.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    )),
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                            child: defaultButton(
                              function: (){
                                setState(() {
                                  AppCubit.get(context).changeAppMode();
                                  // LocalizedApp.restart(context);
                                  Navigator.pop(context);
                                });
                              },
                              textData: valueOne,
                              textSize: 12.sp,
                              width: 40.w,
                              height: 6.h,
                              isUpperCase: false,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child:  ButtonTheme(
                                height: 35.0,
                                minWidth: 110.0,
                                child: defaultButton(
                                  function: (){
                                    Navigator.pop(context);
                                    // functionTwo;
                                  },
                                  textData: valueTwo,
                                  textSize: 12.sp,
                                  width: 30.w,
                                  height: 6.h,
                                  isUpperCase: false,
                                ),
                            ),
                        ),
                      ],
                    ))
              ],
            ));
  }
}





class DialogChangeLanguage extends StatefulWidget {

  const DialogChangeLanguage(
      {Key? key,}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DialogChangeLanguageState();
}

class DialogChangeLanguageState extends State<DialogChangeLanguage>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  DialogChangeLanguageState();

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: buildDialogContainer(
            title: 'You want change language to ' ,
            valueOne: 'languageMode',
            valueTwo: 'Cancel',
          ),
        ),
      ),
    );
  }

  Container buildDialogContainer({required String title,required String valueOne,required String valueTwo,}) {
    return Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(15.0),
        height: 30.h,
        decoration: ShapeDecoration(
          // color: const Color.fromRGBO(41, 167, 77, 10),
            color: kDefaultLightColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0))),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 20.0, right: 20.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                )),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: defaultButton(
                        function: (){
                          setState(() {

                            Navigator.pop(context);
                            print('Light mode value from cache is ${ CacheHelper.returnData(key: 'isDarkMode')}');

                          });
                        },
                        textData: valueOne,
                        textSize: 12.sp,
                        width: 40.w,
                        height: 6.h,
                        isUpperCase: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child:  ButtonTheme(
                        height: 35.0,
                        minWidth: 110.0,
                        child: defaultButton(
                          function: (){
                            Navigator.pop(context);
                            // functionTwo;
                          },
                          textData: valueTwo,
                          textSize: 12.sp,
                          width: 30.w,
                          height: 6.h,
                          isUpperCase: false,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}