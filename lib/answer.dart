import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function callback;
  Answer(this.text, this.callback);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        textColor: Colors.white,
        child: Text(text),
        onPressed: callback,
      ),
    );
  }
}
