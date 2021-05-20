import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:saidin_quiz_app/app/constants.dart';
import 'package:saidin_quiz_app/app/controler/question_controller.dart';
import 'package:saidin_quiz_app/app/models/Questions.dart';

import 'custom_progress.dart';
import 'option.dart';
import 'question_Card.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  QuestionCotroller _qz_cotroller = Get.put(QuestionCotroller());
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: CustomProgressBar(),
              ),
              // Spacer(),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Pergunta 1',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: kSecondaryColor,
                        ),
                    children: [
                      TextSpan(
                        text: '/10',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: kSecondaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(height: kDefaultPadding),

              //Placar de Perguntas

              Expanded(
                child: PageView.builder(
                    itemCount: _qz_cotroller.questions.length,
                    itemBuilder: (context, index) {
                      return QuestionCard(
                        question: _qz_cotroller.questions[index],
                      );
                    }),
              ),
              // ListOptions(),
              SizedBox(height: 23),
            ],
          ),
        ),
      ],
    );
  }
}

/**
class ListOptions extends StatelessWidget {
  const ListOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: question.options.length,
            itemBuilder: (item, index) => OptionCard(
                index: index,
                text: question.options[index],
                press: () {
                  var is_right = question.is_right(index);

                  Get.defaultDialog(
                    title: 'Resultado',
                    content: Text(
                        'A resposta é ${question.options[index]}? :${is_right ? "SIM" : "Nao"} '),
                  );
                })));
  }
}
**/