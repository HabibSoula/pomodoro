import 'package:flutter/material.dart';
import 'package:pomo/app/app.bottomsheets.dart';
import 'package:pomo/app/app.dialogs.dart';
import 'package:pomo/app/app.locator.dart';
import 'package:pomo/app/app.router.dart';
import 'package:pomo/services/notification_service.dart';
import 'package:pomo/ui/common/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();

  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: kcBackgroundColor,
          appBarTheme: AppBarTheme(
            color: kcBackgroundColor,
          )),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
