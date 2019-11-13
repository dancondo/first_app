import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function callback;
  Result(this.score, this.callback);

  String get resultText {
    String text;
    if (score == 140) {
      text = 'You know me more than everyone else!';
    } else if (score > 60) {
      text = 'You know some stuff about me!';
    } else {
      text = 'You don\'t know me. . .';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quizz Finished',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            resultText,
            style: TextStyle(fontSize: 18),
          ),
          RaisedButton(
            child: Text('Play Again!'),
            onPressed: callback,
          )
        ],
      ),
    );
  }
}
