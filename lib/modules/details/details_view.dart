import 'package:flutter/material.dart';
import 'package:pro_derma/modules/details/widgets/appbar.dart';
import 'package:pro_derma/modules/details/widgets/details_screen.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBarDe(context),
      body: const DetailsScreen(),
    );
  }
}
