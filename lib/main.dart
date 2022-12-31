import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
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

final _questions = const [
  {
    'questionText': 'What\'s your favorite color?',
    'answers': [
      {'text': 'Black', 'score': 10},
      {'text': 'Red', 'score': 5},
      {'text': 'Green', 'score': 3},
      {'text': 'White', 'score': 1}
    ]
  },
  {
    'questionText': 'What\'s your favorite animal?',
    'answers': [
      {'text': 'Rabbit', 'score': 3},
      {'text': 'Snake', 'score': 11},
      {'text': 'Elephant', 'score': 5},
      {'text': 'Lion', 'score': 9}
    ]
  },
  {
    'questionText': 'What\'s your favorite food',
    'answers': [
      {'text': 'Pizza', 'score': 10},
      {'text': 'Burger', 'score': 4},
      {'text': 'Pasta', 'score': 9},
      {'text': 'Noodles', 'score': 1}
    ]
  },
  {
    'questionText': 'What\'s your favorite drink',
    'answers': [
      {'text': 'Coke', 'score': 10},
      {'text': 'Pepsi', 'score': 4},
      {'text': 'Fanta', 'score': 9},
      {'text': 'Sprite', 'score': 1}
    ]
  },
];

class _myAppState extends State<myApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      if (_questionIndex != _questions.length) {
        _questionIndex = _questionIndex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Basic Quiz App"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
