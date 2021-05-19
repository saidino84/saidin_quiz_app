class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.answer,
      required this.question,
      required this.options});

  bool is_right(int index) => index == answer;
}

const List simple_questions = [
  {
    'id': 1,
    'question':
        'Flutter is an open-source UI software development kit created by ___________',
    'options': [
      'Apple',
      'Google',
      'Saidino',
      'Facebook',
      'Microsoft',
    ],
    'answer_index': 1,
  },
  {
    'id': 2,
    'question': 'When google release flutter',
    'options': [
      'June 2017',
      'July 2017'
          'May 2017',
      'May 2018',
      'Aug 2016',
      'None is Correct !',
    ],
    'answer_index': 2,
  },
  {
    'id': 3,
    'question': 'A memory location that holds a sigle letter or number.',
    'options': [
      'Double',
      'Int',
      'Char',
      'Word',
      'String',
      'Substring',
      'Querry',
      'ML'
    ],
    'answer_index': 2,
  },
  {
    'id': 4,
    'question': 'Quantos anos tem a a sogunda sorte/filha de saidino?.',
    'options': [
      '2',
      'tres',
      '5',
      '3',
      'quatro',
    ],
    'answer_index': 4,
  },
];
