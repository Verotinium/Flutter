import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './main.dart';

class Answer extends StatelessWidget {
  //const MyWidget({super.key});
  final VoidCallback
  selectHandler; //VoidCallback is used for functions with no arguments and no return value
  final String answerText;

  Answer({
    required this.selectHandler,
    required this.answerText,
  }); //sttless gets data from outside,
  //finish here and brings back to the caller class(main.dart)

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
        style: ElevatedButton.styleFrom(
          //static prop
          backgroundColor: const Color.fromARGB(255, 210, 128, 120),
          foregroundColor: const Color.fromARGB(179, 255, 255, 255), //textcolor
        ),
      ),
    );
  }
}
