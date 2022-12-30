import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

/* void main() {
  runApp(myApp());
} */

void main() => {runApp(myApp())};

class myApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _myAppState();
  }
}

class _myAppState extends State<myApp> {
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      if (_questionIndex == 3) {
        _questionIndex = 0;
      } else {
        _questionIndex = _questionIndex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'What\'s your favorite food?',
        'answers': ['Pizza', 'Burger', 'Pasta', 'Salad'],
      },
      {
        'questionText': 'What\'s your favorite drink?',
        'answers': ['Coke', 'Pepsi', 'Fanta', 'Sprite'],
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Basic Quiz App"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answers'] as List<String>).map((e) {
              return Answer(_answerQuestion, e);
            }).toList()
          ],
        ),
      ),
    );
  }
}
