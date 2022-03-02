import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selector;
  final String answerText;
  Answer(this.selector,this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Color.fromARGB(212, 8, 80, 235),
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selector,
      ),
    );
  }
}
