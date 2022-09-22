import 'package:flutter/material.dart';
import 'package:pro_derma/modules/home/widgets/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../models/home_model.dart';
import '../../../shared/components/components.dart';
import 'list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key,required this.homeModel}) : super(key: key);

  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsetsDirectional.only(start: 3.w, end: 2.w,),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*buildTextHeader(text: 'Popular'),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          '75%',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        verticalSpace(2),
                        const Text(
                          '75%',
                        ),

                        verticalSpace(2),
                        const Text('data'),
                        verticalSpace(2),
                        const Text('data'),
                        verticalSpace(2),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 5,
                    child: Image(
                      image: AssetImage('assets/images/on_boarding1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),*/

            CarouselSlider(
              items: itemsCarouselList,
              options: CarouselOptions(
                height: 20.h,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                viewportFraction: 1,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            verticalSpace(2),
            Text(
                AppLocalizations.of(context)!.categories,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            verticalSpace(1),
            SizedBox(
              height: 20.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildCategoryItemList(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            ),
            verticalSpace(2),
            Text(
              'Popular',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            verticalSpace(.5),
            ListView.builder(
              itemBuilder: ((context, index) => buildPopularItemList(context,homeModel.dataModel[index])),
              itemCount: homeModel.dataModel.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            // verticalSpace(2),
          ],
        ),
      ),
    );
  }


}

List<Widget> itemsCarouselList = [

  buildCarouselSliderItem(
    color: const Color(0xFF39A1D9),
    imageName: 'assets/images/pump_foam.jpg',
    textHeader: 'Pump Foam Brush',
    textBody: 'Discover the special packages now, especially for you',
    onTap: (){},
  ),
  buildCarouselSliderItem(
    color: const Color(0xFFF99E02),
    imageName: 'assets/images/black_pump.jpg',
    textHeader: 'Black Pump',
    textBody: 'Gain Business awareness',
    onTap: (){},
  ),
  buildCarouselSliderItem(
    color: const Color(0xFF39D9D9),
    imageName: 'assets/images/on_boarding2.jpg',
    textHeader: 'Smart Home',
    textBody: 'A professional installation at no cost to you to work in the way that best suits your needs.',
    onTap: (){},
  ),

];
