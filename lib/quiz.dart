import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function callback;
  final int index;
  Quiz({
    @required this.questions,
    @required this.callback,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[index]['text']),
      ...(questions[index]['answers'] as List<Map<String, Object>>).map((answer) {
        return Answer(answer['text'], () => callback(answer['score']));
      }).toList()
    ]);
  }
}
