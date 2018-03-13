import './question.dart';
class Quiz {
  final List<Question> _questions;
  int _currentQuestionidex = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  List<Question> get questions =>_questions;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionidex + 1;
  int get score => _score;

  Question get nextQuestion {
    _currentQuestionidex++;
    if (_currentQuestionidex >= length) return null;
    return _questions[_currentQuestionidex];
  }

  void answer(bool isCorret) {
    if (isCorret)
      _score++;
  }

}