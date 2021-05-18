import 'package:flutter/material.dart';
import 'package:saidin_quiz_app/app/constants.dart';

class WellComePage extends StatelessWidget {
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purpleAccent.withOpacity(0.4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
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
                Spacer(),
                TextField(
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.deepPurple.withOpacity(0.4),
                    filled: true,
                    hintText: 'Oi , seu aqui !',
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
                Spacer(),
                InkWell(
                  onTap: () {
                    showAboutDialog(context: context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(kDefaultPadding * 0.75),
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
                Spacer(),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
