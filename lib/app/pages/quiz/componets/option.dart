import 'package:get/get.dart';
import 'package:saidin_quiz_app/app/constants.dart';
import 'package:saidin_quiz_app/app/controler/question_controller.dart';
import 'package:saidin_quiz_app/app/models/Questions.dart';
import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionCotroller>(
        init: QuestionCotroller(),
        builder: (qzcontroller) {
          Color getTheRightColor() {
            //todo [fn] exta funcao verifica se
            if (qzcontroller.isAnswered) {
              if (index == qzcontroller.corectAnswr) {
                return kGreenColor;
              } else if (index == qzcontroller.selectedAnswr &&
                  qzcontroller.selectedAnswr != qzcontroller.corectAnswr) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(
                kDefaultPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: getTheRightColor(),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1}. $text',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: getTheRightColor(),
                        ),
                  ),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      //se acor retornada com a uncao getRightColor\
                      // for gray vou esconder a bolinha [com color TRANSPARENT]
                      //caso nao tera ACOR retornada k é a zul
                      color: getTheRightColor() == kGrayColor
                          ? Colors.transparent
                          : getTheRightColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: getTheRightColor(), //Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
