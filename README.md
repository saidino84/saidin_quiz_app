# saidin_quiz_app


# o commit (8) mostrando [Usando Animation, AnimationController com Getx, uso de Tween]
>Focando na parte de Animation

```dart

//question_controller.dart


import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class QuestioCotroller extends GetxController
    with SingleGetTickerProviderMixin {
  //lets aimate our progress bar
  late Animation _animation;
  late AnimationController _animcontroller;

  //so that we we can acess our animation outside
  Animation get animation => this._animation;

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
}


```
>NB:[] Para usar ovalor de animation precisamos :
```dart
 var controller =Get.find<QuestionController>();
 var value=controller.animation.value;
 width=constraints.maxWidth*controller.animation.value; 

  e pra obter o valor em cada segundo precisamos multiplivar o value de animation por 60 segundos k sao os segundos
  que definimos com a duracoa maxima desta animation ;
  var seg=(controller.animation.value* 60).round(); //arendondar pk aparecera em pontos flutuantes
```
> E na parte do view fazedo update de width do Container com gradient:

```dart
mport 'package:flutter/material.dart';
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
      child: GetBuilder<QuestioCotroller>(
          init: QuestioCotroller(),
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
                      Text('${controller.animation.value} sec'),
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

```

# O preview deste efeito ficou :
![Preview](/animation1.gif)
![Preview](/animation2.gif)
![Preview](/animation3.gif)


# Alogica de trocar cor quando for selecionado uma opcao e trocar cor se for certa Cor verde e se for erada cor vermelha e notiicar todos os k estiverem escutando..

> 1. no questio_controller.dart adicionei as variaveis capaz de saber opcao certa, erada, selecionada...

```dart


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

  void checkAnswer(Question question, int selectedIndex) {
    //becouise once user press any option it will run
    _isAnswered = true; //quando or clicado ja notifico todos k agora ja foi respondido ,
    _correctAnswr = question.answer; //e falo qual é a pcao correcta !
    _selectedAnswr = selectedIndex; //e indico o selected index=index_clicado


//se answer correcto foi selecionado ? then incremento a variavel das respostas certas
    if (_correctAnswr == _selectedAnswr) _numOfCorrectAnswr++;
    //it will stop athe conter
    _animcontroller.stop();  //pause animacao
    update();
  }
}


```

#E NO CODICO DA PARTE DAS OPCOES É :
>fiz todo card de option dentro de um GetBuilder pra escutar as modicacoes 
>que o correrem dentro quz_controller

```dart
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




```
#Acompanhe RESULTADO QUANDO OR CLICADO
![Preview](/animation4.gif)
![Preview](/animation5.gif)