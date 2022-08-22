import 'package:flutter/material.dart';
import 'package:second_app/result.dart';

import './question.dart';

import './answer.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz(){
    setState(() {
       questionIndex = 0;
       totalScore = 0;
    });
  }

  final questions = const [
    //making a map{} with questiontext and answer as key value pairs into questions list[]
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 6},
        {'text': 'White', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Rabbit', 'score': 8},
        {'text': 'Zebra', 'score': 6},
        {'text': 'Cat', 'score': 4},
      ],
    },
    {
      'questionText': 'Who\'s your favorite Car?',
      'answers': [
        {'text': 'Benz', 'score': 10},
        {'text': 'Ferrari', 'score': 8},
        {'text': 'Rover', 'score': 6},
        {'text': 'Nissan', 'score': 4},
      ],
    },
  ];

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
    if (questionIndex < questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              )
            : Result(totalScore,resetQuiz), // : indicates end of if condition block started after ?
      ),
    );
  }
}
