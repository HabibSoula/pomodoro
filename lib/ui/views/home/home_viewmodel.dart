import 'package:pomo/app/app.bottomsheets.dart';
import 'package:pomo/app/app.dialogs.dart';
import 'package:pomo/app/app.locator.dart';
import 'package:pomo/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  NavigationService get navigationService => _navigationService;
  int _sessions = 1;
  int _shortBreak = 0;
  int _longBreak = 0;
  bool _isValid = false;

  int get sessions => _sessions;

  int get shortBreak => _shortBreak;

  int get longBreak => _longBreak;

  bool get isValid => _isValid;

  double getSessions(double value) {
    _sessions = value.toInt();
    rebuildUi();
    return _sessions.toDouble();
  }

  double getShortBreak(double value) {
    _shortBreak = value.toInt();
    rebuildUi();
    return _shortBreak.toDouble();
  }

  double getLongBreak(double value) {
    _longBreak = value.toInt();
    rebuildUi();
    return _longBreak.toDouble();
  }

  void reset() {
    _sessions = 1;
    _shortBreak = 0;
    _longBreak = 0;
  }

  void changeValidity() {
    _isValid = true;
    rebuildUi();
  }

  void changeValidityToFalse() {
    _isValid = false;
    rebuildUi();
  }
}
