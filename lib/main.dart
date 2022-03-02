import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';

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

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
  }

  var questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'Yellow'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Cat', 'Mouse', 'Lion', 'Eagle'],
    },
    {
      'questionText': 'Who\'s your favorite Car?',
      'answers': ['Benz', 'Ferrari', 'Honda', 'BMW'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: Column(children: [
          Question(
            questions[questionIndex]['questionText'] as String,
          ),
          // Answer(answerQuestion),
          //Answer(answerQuestion),
          //Answer(answerQuestion),
          //list
          ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
            return Answer(answerQuestion,answer);
          }).toList(),
        ]),
      ),
    );
  }
}
