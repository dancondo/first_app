import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _totalScore = 0;
  var _questionIndex = 0;
  static const _questions = [
    {
      'text': 'What\'s my favorite Web programming language?',
      'answers': [
        {'text': 'Javascript', 'score': 50},
        {'text': 'Ruby', 'score': 25},
        {'text': 'Python', 'score': 10},
        {'text': 'PHP', 'score': 0},
      ]
    },
    {
      'text': 'What\'s my favorite Javascript frontend Framework?',
      'answers': [
        {'text': 'React.js', 'score': 15},
        {'text': 'Vue.js', 'score': 40},
        {'text': 'Angular.js', 'score': 10},
        {'text': 'Jquery', 'score': 5},
      ]
    },
    {
      'text': 'What\'s my favorite Javascript backend framework?',
      'answers': [
        {'text': 'Nest.js', 'score': 40},
        {'text': 'Adonis.js', 'score': 5},
        {'text': 'Sails.js', 'score': 20},
        {'text': 'Express.js', 'score': 50},
      ]
    }
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _clear() {
    _totalScore = 0;
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.cyan,
          buttonColor: Colors.cyan,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('My App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  callback: _answerQuestion,
                  index: _questionIndex,
                )
              : Result(_totalScore, _clear),
        ));
  }
}
