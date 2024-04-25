import 'package:stacked/stacked.dart';
import 'package:pomo/app/app.locator.dart';
import 'package:pomo/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final List<String> _quotes = [
    "السير في طريق الوصول وصول",
    "مهما تصور أو صدق عقل الإنسان, فإنه قادر على تحقيقه",
    "لن تكون قادراً على قطع المحيط إذا لم يكن لديك الشجاعة أن تخسر مرآى الشاطئ",
    "كن التغير الذي تريد أن تراه في العالم",
    "لا يهم كم أنت بطيئ طالما أنك لن تتوقف",
  ];

  List<String> get quotes => _quotes;

  String getRandomQuote() {
    return (_quotes..shuffle()).first;
  }

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 5));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }
}
