import 'package:flutter/material.dart';
import "package:my_app/quiz.dart";
import "package:my_app/result.dart";

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _question = const [
    {
      'questionText': "What\'s your favorite color?",
      'answer': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Yellow', 'score': 1},
      ],
    },
    {
      'questionText': "What\'s your favorite animal?",
      'answer': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': "who\'s your favorite instructor?",
      'answer': [
        {'text': 'Dylan', 'score': 1},
        {'text': 'john', 'score': 1},
        {'text': 'alex', 'score': 1},
        {'text': 'max', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _updateQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                question: _question,
                questionIndex: _questionIndex,
                updateQuestion: _updateQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
