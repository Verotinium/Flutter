import 'package:flutter/material.dart';
import 'package:flutter_complete_guidance/answer.dart';
import 'package:flutter_complete_guidance/quiz.dart';
import './question.dart';
import './quiz.dart';
import './result.dart';
//can import cuz dont have _on the Question class

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    //
    return _MyAppState();
  }
}

//
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's my favourite color?",
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Red', 'score': 3},
        {'text': 'Blue', 'score': 7},
      ],
    },
    {
      'questionText': "What's my favourite animal?",
      'answer': [
        {'text': 'Racoon', 'score': 3},
        {'text': 'Cat', 'score': 5},
        {'text': 'Shark', 'score': 7},
        {'text': 'Eagle', 'score': 10},
      ],
    },
    {
      'questionText': "What's is my favourite food?",
      'answer': [
        {'text': 'Burger', 'score': 10},
        {'text': 'Oats', 'score': 5},
        {'text': 'Briyani', 'score': 7},
        {'text': 'Tapioca', 'score': 3},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //var abool = true;
    //abool = false;

    _totalScore += score;

    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    } else {
      print('No more questions!');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 205, 177, 126),
        appBar: AppBar(title: Text('How well do you know me?')),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/quiz_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(10),
          //color: Colors.blue,
          //alignment: Alignment.center,
          //width: double.infinity,
          //height: double.infinity,
          //margin: EdgeInsets.all(50),
          child:
              _questionIndex < _questions.length
                  ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                  : Result(resultScore: _totalScore, resetHandler: resetQuiz),
          //Result(_totalScore, resetQuiz),
        ),
      ),
    );
    //return MaterialApp(
  }
}
