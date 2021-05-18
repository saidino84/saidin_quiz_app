import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:saidin_quiz_app/app/constants.dart';
import 'package:saidin_quiz_app/app/pages/quiz/quiz_page.dart';

class WellComePage extends StatelessWidget {
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         Colors.deepPurple,
          //         Colors.purpleAccent.withOpacity(0.4),
          //       ],
          //       begin: Alignment.topRight,
          //       end: Alignment.bottomLeft,
          //     ),
          //   ),
          child: SvgPicture.asset('assets/icons/bg.svg', fit: BoxFit.cover),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 2), // it will take 2/6 spaces
                Text(
                  "Let's Play Sadino Questions !",
                  // textDirection: TextDirection.rtl,
                  // textWidthBasis: TextWidthBasis.longestLine,
                  // textAlign: TextAlign.center,
                  // overflow: TextOverflow.fade,
                  // maxLines: 3,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white60,
                      ),
                ),
                // Spacer(),
                Text(
                  'Enter your informations below ! ',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.w100,
                        color: Colors.white24,
                      ),
                ),
                Spacer(), //1/6
                TextField(
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    fillColor: Color(0xFF1C2341),
                    filled: true,
                    hintText: 'Oi , Nome seu aqui !',
                    hintStyle: TextStyle(
                      color: Colors.white24,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Spacer(), // it will take 1/6
                InkWell(
                  onTap: () => Get.to(
                    () => QuizScreen(),
                    curve: Curves.easeInCubic,
                    duration: Duration(microseconds: 500),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(kDefaultPadding * 0.75), //15
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: KPrimaryGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Let's Start Quiz !",
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Spacer(flex: 2), //it will take 2/6
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
