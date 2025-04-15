import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result({
    //super.key,
    required this.resultScore,
    required this.resetHandler,
  });

  // Getter to determine result phrase
  String get resultPhrase {
    if (resultScore <= 10) return "You don't know me at all! 🙄";
    if (resultScore <= 15) return "We've met... somewhere? 🤔";
    if (resultScore <= 20) return "You know me pretty well! 😊";
    return "You're my soulmate! 💖";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Result text
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              resultPhrase,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Restart button
          ElevatedButton.icon(
            onPressed: resetHandler,
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text(
              'Restart Quiz',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
