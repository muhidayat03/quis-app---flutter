import "package:flutter/material.dart";
import 'package:my_app/Question.dart';
import "package:my_app/answer.dart";

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final Function updateQuestion;
  final int questionIndex;

  Quiz({
    @required this.question,
    @required this.updateQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(question[questionIndex]['questionText']),
      ...(question[questionIndex]['answer'] as List<Map<String, Object>>).map(
        (answer) {
          return Answer(() => updateQuestion(answer['score']), answer['text']);
        },
      ).toList()
    ]);
  }
}
