import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  static const _questions = [
    {
      'text': 'What\'s your favorite color?',
      'answers': ['Black', 'White', 'Red', 'Green']
    },
    {
      'text': 'What\'s your favorite animal?',
      'answers': ['Cat', 'Dog', 'Bird', 'Fish']
    }
  ];
  void _answerQuestion() {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
    print(_questionIndex);
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
              ? Column(children: [
                  Question(_questions[_questionIndex]['text']),
                  ...(_questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(answer, _answerQuestion);
                  }).toList()
                ])
              : Center(
                  child: Text('No Questions'),
                )),
    );
  }
}
