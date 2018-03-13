import 'package:flutter/material.dart';

import '../domain/quiz.dart';
import '../domain/question.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget {

  @override 
  QuizPageState createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  final Quiz _quiz = new Quiz([
    new Question("Elon Musk is human", false),
    new Question("Pizza is healthy", false),
    new Question("Flutter is awesome", true)
  ]);

  Question _currentQuestion;  
  String _questionText;
  int _questionNumber;    
  bool _isCorrect;
  bool _overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    _currentQuestion = _quiz.nextQuestion;
    _questionText = _currentQuestion.question;
    _questionNumber = _quiz.questionNumber;    
  }

  void handleAnswer(bool answer) {
    _isCorrect = (_currentQuestion.answer == answer);
    _quiz.answer(_isCorrect);
    this.setState(
      () {
        _overlayShouldBeVisible = true;
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => this.handleAnswer(true)),
            new QuestionText(_questionText, _questionNumber),
            new AnswerButton(false, () => this.handleAnswer(false))
          ],                  
        ),
        _overlayShouldBeVisible ? new CorrectWrongOverlay(
          _isCorrect,
          () {
            _currentQuestion = _quiz.nextQuestion;
            this.setState(() {
              _overlayShouldBeVisible = false;
              _questionText = _currentQuestion.question;
              _questionNumber = _quiz.questionNumber;
            });
          }
        ) : new Container()
      ],      
    );

  }
} 