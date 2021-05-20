import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saidin_quiz_app/app/constants.dart';
import 'package:saidin_quiz_app/app/controler/question_controller.dart';
import 'package:saidin_quiz_app/app/models/Questions.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    var qz_controller = Get.find<QuestionCotroller>();
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: kGrayColor,
                  ),
            ),
            //todo [ x ] QuestionTile(question:simple_questions[0]['question']),
            SizedBox(height: kDefaultPadding / 2),
            // OptionCard(index:question.id,text:question.options[index]),
            //   OptionCard(),
            //   OptionCard(),

            //   OptionCard(),

            //todo ---------------------------------------- ]
            // ...List.generate(
            //   question.options.length,
            //   (index) => OptionCard(
            //     index: index,
            //     text: question.options[index],
            //     press: () {
            //       var is_right = question.is_right(index);

            //       Get.defaultDialog(
            //         title: 'Resultado',
            //         content: Text(
            //             'A resposta é ${question.options[index]}? :${is_right ? "SIM" : "Nao"} '),
            //       );
            //     },
            //   ),
            // ),

            //todo  MINHA OPINIAO==
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (item, index) => OptionCard(
                  index: index,
                  text: question.options[index],
                  press: () => qz_controller.checkAnswer(
                      question, index), //heckAns(question: index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Expanded(
//                 child: ListView.builder(
//                     itemCount: question.options.length,
//                     itemBuilder: (item, index) => OptionCard(
//                         index: index,
//                         text: question.options[index],
//                         press: () {
//                           var is_right = question.is_right(index);

//                           Get.defaultDialog(
//                             title: 'Resultado',
//                             content: Text(
//                                 'A resposta é ${question.options[index]}? :${is_right ? "SIM" : "Nao"} '),
//                           );
//                         })))