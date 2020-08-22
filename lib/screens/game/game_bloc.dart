import 'dart:async';

const _DONE = 0;
const _ONE_SECOND = 1;
const _COUNTDOWN_TIME = 9;

class GameBloc {
  List<String> _wordList;

  final _scoreController = StreamController<int>();

  Stream<int> get scoreStream => _scoreController.stream;
  int score = 0;

  final _wordController = StreamController<String>();

  Stream<String> get wordStream => _wordController.stream;
  String _word = '';

  final _eventGameFinishedController = StreamController<bool>();

  Stream<bool> get eventGameFinishedStream =>
      _eventGameFinishedController.stream;

  final _timerController = StreamController<int>();

  Stream<int> get timerStream => _timerController.stream;

  Timer _timer;
  int _currentTime = _COUNTDOWN_TIME;

  GameBloc() {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: _ONE_SECOND), (timer) {
      if (_currentTime > 0) {
        _timerController.add(_currentTime--);
      } else {
        _timerController.add(_DONE);
        timer.cancel();
        _onGameFinished();
      }
    });
  }

  void resetList() {
    _wordList = [
      "queen",
      "hospital",
      "basketball",
      "cat",
      "change",
      "snail",
      "soup",
      "calendar",
      "sad",
      "desk",
      "guitar",
      "home",
      "railway",
      "zebra",
      "jelly",
      "car",
      "crow",
      "trade",
      "bag",
      "roll",
      "bubble",
    ];
    _wordList.shuffle();
  }

  void onSkip() {
    score--;
    _scoreController.add(score);
    nextWord();
  }

  void onCorrect() {
    score++;
    _scoreController.add(score);
    nextWord();
  }

  void nextWord() {
    if (_wordList.isNotEmpty) {
      _word = _wordList.removeAt(0);
      _wordController.add(_word);
    } else {
      resetList();
    }
  }

  void _onGameFinished() {
    _eventGameFinishedController.add(_wordList.isEmpty);
  }

  void dispose() {
    _timer.cancel();
    _wordController.close();
    _scoreController.close();
  }
}
