import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:pomo/ui/common/size_config.dart';
import 'package:stacked/stacked.dart';
import 'package:pomo/ui/common/ui_helpers.dart';

import '../../common/app_colors.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 30.0.w,
                  fontFamily: 'Agne',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    FadeAnimatedText(
                      viewModel.getRandomQuote(),
                      textAlign: TextAlign.center,
                      duration: const Duration(
                        milliseconds: 4000,
                      ),
                      textStyle: TextStyle(
                          fontSize: 42.0.w,
                          fontWeight: FontWeight.w900,
                          color: kcVeryLightGrey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
