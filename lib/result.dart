import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;
  Result(this.totalScore, this.resetQuiz);

  String get resultText {
    String resultText;
    if (totalScore <= 8) {
      resultText = 'You are awesome and innocent!!!';
    } else if (totalScore <= 12) {
      resultText = 'You are pretty likeable!!!';
    } else if (totalScore <= 16) {
      resultText = 'You are ... strange???';
    } else {
      resultText = 'You are so bad :(';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultText,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: resetQuiz,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
