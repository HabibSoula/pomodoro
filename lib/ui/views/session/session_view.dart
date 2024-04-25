import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pomo/app/app.router.dart';
import 'package:pomo/ui/common/size_config.dart';
import 'package:pomo/ui/views/session/widget/circular_button.dart';
import 'package:stacked/stacked.dart';

import '../../../services/notification_service.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../home/home_view.dart';
import 'session_viewmodel.dart';

class SessionView extends StackedView<SessionViewModel> {
  final String title;
  final int workDuration;
  final int breakDuration;
  final int longBreakDuration;
  final int totalSessions;
  final int? doneSessions;

  const SessionView({
    Key? key,
    required this.title,
    required this.workDuration,
    required this.breakDuration,
    required this.totalSessions,
    required this.longBreakDuration,
    this.doneSessions,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SessionViewModel viewModel,
    Widget? child,
  ) {
    viewModel.setTimerToWorkingSessionInSeconds(workDuration);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            title,
            style: TextStyle(
                fontSize: 21.0.w,
                fontWeight: FontWeight.w600,
                color: kcVeryLightGrey),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0.h,
                horizontal: 24.0.w,
              ),
              child: Center(
                child: CircularCountDownTimer(
                  duration: viewModel.durationInSeconds,
                  initialDuration: 0,
                  controller: viewModel.controller,
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 3,
                  ringColor: kcCircleColor,
                  ringGradient: null,
                  fillColor: kcLightBlue,
                  fillGradient: null,
                  backgroundColor: Colors.transparent,
                  backgroundGradient: null,
                  strokeWidth: 20.0.w,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: 36.0.w,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.MM_SS,
                  isReverse: true,
                  isReverseAnimation: false,
                  isTimerTextShown: true,
                  autoStart: true,
                  onStart: () {},
                  onComplete: () {
                    if (viewModel.isPrimarySession) {
                      NotificationService().showNotification(
                          title: 'Time for a break !!',
                          body: 'Well done champion, Im proud of you');
                      viewModel.updateTimerToLongBreak(
                        breakDuration,
                        longBreakDuration,
                        totalSessions,
                      );
                    } else {
                      NotificationService().showNotification(
                          title: 'Time to get back to work !!',
                          body: 'We go back to work, we go back to the grind.');
                      viewModel.updateTimerToWorkingSession(
                          workDuration, totalSessions);
                      viewModel.incrementSessions();
                    }
                  },
                  onChange: (String timeStamp) {
                    print('Countdown Changed $timeStamp');
                  },
                  timeFormatterFunction: (defaultFormatterFunction, duration) {
                    if (viewModel.sessions == totalSessions) {
                      return "KAMALNA";
                    } else {
                      return Function.apply(
                          defaultFormatterFunction, [duration]);
                    }
                  },
                ),
              ),
            ),
            verticalSpaceLarge,
            Text(
              '${viewModel.sessions} out of $totalSessions sessions',
              style: TextStyle(
                  fontSize: 16.0.w,
                  fontWeight: FontWeight.w600,
                  color: kcLightBlue),
            ),
            verticalSpaceLarge,
            Text(
              'Stay focused for ${viewModel.getWorkingSessionInMinutes()} minutes',
              style: TextStyle(
                  fontSize: 20.0.w,
                  fontWeight: FontWeight.w900,
                  color: kcMediumGrey),
            ),
            verticalSpaceMassive,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(
                  width: 50.0,
                  height: 50.0,
                  color: kcCircleColor,
                  icon: Icons.restart_alt,
                  isPrimary: false,
                  onTap: () {
                    viewModel.restartTimer();
                  },
                ),
                CircularButton(
                  width: 80.0,
                  height: 80.0,
                  color: kcLightBlue,
                  icon: viewModel.controller.isPaused
                      ? Icons.play_arrow
                      : Icons.pause,
                  onTap: () {
                    if (viewModel.controller.isPaused) {
                      viewModel.resumeTimer();
                    } else {
                      viewModel.pauseTimer();
                    }
                  },
                ),
                CircularButton(
                  width: 50.0,
                  height: 50.0,
                  color: kcCircleColor,
                  icon: Icons.stop,
                  isPrimary: false,
                  onTap: () {
                    viewModel.navigationService.back();
                  },
                ),
              ],
            ),
          ],
        ));
  }

  @override
  SessionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SessionViewModel();
}
