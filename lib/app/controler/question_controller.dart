import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:saidin_quiz_app/app/models/Questions.dart';

class QuestionCotroller extends GetxController
    with SingleGetTickerProviderMixin {
  //lets aimate our progress bar
  late Animation _animation;
  late AnimationController _animcontroller;

  //so that we we can acess our animation outside
  Animation get animation => this._animation;
  List<Question> _questions = simple_questions
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            answer: question['answer_index'],
            options: question['options'],
          ))
      .toList();

  List<Question> get questions => this._questions;

  //todo===========  ALOGICA DE PEGAR O ITEM CLICADO E O CERTO DO ERRAD ===========
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAnswr;
  int get corectAnswr => this._correctAnswr;

  late int _selectedAnswr;
  int get selectedAnswr => this._selectedAnswr;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAnswr = 0;
  int get numCorrectAns => this._numOfCorrectAnswr;

//called immediately after the widget is allocated memory
  @override
  void onInit() {
    //our animation duration is 60s
    //so our plan to fill the progress bar within 60s
    _animcontroller =
        AnimationController(duration: Duration(seconds: 10), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animcontroller)
      ..addListener(() {
        //update like setState
        print('ya');
        update(); // fara actualizar cada mudanca que animation.value recebera ate chegar de 0->1 dentro de 60 segundos
      });
    //start our aimation
    _animcontroller.forward();
    // update();
    super.onInit();
  }

  void checkAnswer(Question question, int selectedIndex) {
    //becouise once user press any option it will run
    _isAnswered = true;
    _correctAnswr = question.answer;
    _selectedAnswr = selectedIndex;

    if (_correctAnswr == _selectedAnswr) _numOfCorrectAnswr++;
    //it will stop athe conter
    _animcontroller.stop();
    update();
  }
}
