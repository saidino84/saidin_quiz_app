import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saidin_quiz_app/app/constants.dart';

import 'custom_progress.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //bg
        Container(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(
            'assets/icons/bg.svg',
            fit: BoxFit.fill,
          ),
        ),

        //progress loader and other contents
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Column(
              children: [
                CustomProgressBar(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
