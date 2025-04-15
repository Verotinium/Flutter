import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './main.dart';

class Quiz extends StatelessWidget {
  //const MyWidget({super.key});
  final List<Map<String, Object>> questions;
  final int questionIndex; //final var, not changeable
  final Function(int) answerQuestion; //name of fxn in main.dart

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }); //sttless gets data from outside,

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
              return Answer(
                selectHandler: () => answerQuestion(answer['score'] as int),
                answerText: answer['text'] as String,
              );
            })
            .toList(),
      ],
    );
  }
}
