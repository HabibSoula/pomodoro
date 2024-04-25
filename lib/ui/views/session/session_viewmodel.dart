import 'package:stacked/stacked.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SessionViewModel extends BaseViewModel {
  final CountDownController _controller = CountDownController();
  bool _isPrimarySession = true;
  int _durationInSeconds = 5;
  int _miniSessions = 0;
  int _sessions = 0;

  CountDownController get controller => _controller;

  final _navigationService = locator<NavigationService>();

  NavigationService get navigationService => _navigationService;

  bool get isPrimarySession => _isPrimarySession;

  int get durationInSeconds => _durationInSeconds;

  int get miniSessions => _miniSessions;

  int get sessions => _sessions;

  void pauseTimer() {
    _controller.pause();
    rebuildUi();
  }

  void resumeTimer() {
    _controller.resume();
    rebuildUi();
  }

  void restartTimer() {
    _controller.restart();
    rebuildUi();
  }

  void updateTimerToWorkingSession(int dur, int sess) {
    if (_miniSessions == ((sess * 2) - 1)) {
    } else {
      _durationInSeconds = dur;
      _controller.restart(duration: _durationInSeconds);
      _isPrimarySession = true;
      _miniSessions++;
      print(_miniSessions);
    }
    rebuildUi();
  }

  int getWorkingSessionInMinutes() {
    return _durationInSeconds ~/ 60;
  }

  void setTimerToWorkingSessionInSeconds(int dur) {
    _durationInSeconds = dur;
  }

  void updateTimerToShortBreak(int dur, int sess) {
    rebuildUi();
  }

  void incrementSessions() {
    _sessions++;
    rebuildUi();
  }

  void incrementMiniSessions() {
    _miniSessions++;
    rebuildUi();
  }

  void updateTimerToLongBreak(int short, int longer, int sess) {
    if (_miniSessions > 0 &&
        (_miniSessions - 1) % 2 == 1 &&
        _sessions % 2 == 1) {
      _controller.restart(duration: longer);
      _isPrimarySession = false;
      _miniSessions++;
      print(_miniSessions);
    } else if (_miniSessions == ((sess * 2) - 1)) {
      pauseTimer();
    } else {
      _controller.restart(duration: short);
      _isPrimarySession = false;
      _miniSessions++;
      print(_miniSessions);
    }
    rebuildUi();
  }
}
