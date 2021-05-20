import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:saidin_quiz_app/app/constants.dart';
import 'package:saidin_quiz_app/app/controler/question_controller.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: EdgeInsets.all(3),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF3F4768),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GetBuilder<QuestionCotroller>(
          init: QuestionCotroller(),
          builder: (controller) {
            print(controller.animation.value);
            return Stack(
              children: [
                //Layout builder provides us the available space for the container
                //cosntaits.maxWidth needed ouir aimation
                // se quisermos recuperar o width do parent pegaraemos constraints.maxWidth { e fazermos nossos calculos:}
                // caso queira 10%  basta width:constraints.maxWidth *0.1 //cover 10%
                LayoutBuilder(
                  builder: (ctx, constraints) => Container(
                    /*
                    width: constraints.maxWidth *
                        0.52, //ocupara 50%  [repare que aqui aproveitai o
                     LayoutBuilder para pegar constarits de um parent  ] 
                     todo ][ como 0.5 corrresponde a 50% setamos entao o 
                     todo [] Twen do meu animation(start:0 e end:1 como 100%)
                     todo ][ e usarei esse mesmo valor pra fazer incremetar no width deste progress
                     **/
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                      gradient: KPrimaryGradient,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${(controller.animation.value * 60).round()} sec'),
                      // Icon(
                      //   Icons.record_voice_over,
                      //   color: Colors.amberAccent,
                      // ),
                      SvgPicture.asset('assets/icons/clock.svg'),
                    ],
                  ),
                )),
              ],
            );
          }),
    );
  }
}
