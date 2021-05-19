import 'package:flutter/material.dart';
import 'package:saidin_quiz_app/app/constants.dart';
import 'package:saidin_quiz_app/app/models/Questions.dart';

class QuestionTile extends StatelessWidget {
  final String question;
  const QuestionTile({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.question,
      style: Theme.of(context).textTheme.headline6!.copyWith(
            color: kGrayColor,
          ),
    );
  }
}
