import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {
      @required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex
      }
      );
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // ? enables the condition questionIndex < questions.length
      Question(
        questions[questionIndex]['questionText']
            as String, //as string helps with null safety since ! is not enough, also String? username does the job
      ),
      // Answer(answerQuestion),
      //Answer(answerQuestion),
      //Answer(answerQuestion),
      //list
      ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
        return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
      }).toList(),
    ]);
  }
}
