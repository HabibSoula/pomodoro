import 'package:flutter/material.dart';
import 'package:pomo/app/app.router.dart';
import 'package:pomo/ui/common/size_config.dart';
import 'package:pomo/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:pomo/ui/common/app_colors.dart';
import 'package:pomo/ui/common/ui_helpers.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'title'),
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Session Creation",
          style: TextStyle(
              fontSize: 21.0.w,
              fontWeight: FontWeight.w600,
              color: kcVeryLightGrey),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0.w,
          vertical: 24.0.h,
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(
                  fontSize: 16.0.w,
                  fontWeight: FontWeight.w600,
                  color: kcVeryLightGrey),
            ),
            verticalSpaceSmall,
            Container(
              decoration: BoxDecoration(
                color: kcTextFieldBackgroundColor, // Background color
                borderRadius: BorderRadius.circular(50.0.w), // Border radius
              ),
              child: TextField(
                style: TextStyle(
                  color: kcLightGrey,
                  fontSize: 14.0.w,
                ),
                controller: titleController,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    viewModel.changeValidityToFalse();
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // Remove the default border

                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  // Padding for text input
                  // Remove the default border
                  hintText: 'What activity are you doing ?',
                  hintStyle: TextStyle(
                    color: kcMediumGrey,
                    fontSize: 14.0.w,
                  ),
                  // Placeholder text
                ),
              ),
            ),
            verticalSpaceTiny,
            viewModel.isValid
                ? Text(
                    'Oops, sounds like you forgot this!',
                    style: TextStyle(
                        fontSize: 14.0.w,
                        fontWeight: FontWeight.w400,
                        color: kcLightBlue),
                  )
                : const SizedBox(),
            verticalSpaceLarge,
            Text(
              'Working sessions',
              style: TextStyle(
                  fontSize: 16.0.w,
                  fontWeight: FontWeight.w600,
                  color: kcVeryLightGrey),
            ),
            SfSlider(
                min: 1.toDouble(),
                max: 10.toDouble(),
                value: viewModel.sessions,
                interval: 1,
                showLabels: true,
                activeColor: kcLightBlue,
                inactiveColor: kcTextFieldBackgroundColor,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  viewModel.getSessions(value);
                }),
            verticalSpaceLarge,
            Text(
              'Short Break Duration',
              style: TextStyle(
                  fontSize: 16.0.w,
                  fontWeight: FontWeight.w600,
                  color: kcVeryLightGrey),
            ),
            SfSlider(
                min: 0.toDouble(),
                max: 10.toDouble(),
                value: viewModel.shortBreak,
                interval: 1,
                showLabels: true,
                activeColor: kcLightBlue,
                inactiveColor: kcTextFieldBackgroundColor,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  viewModel.getShortBreak(value);
                }),
            verticalSpaceLarge,
            Text(
              'Long break duration',
              style: TextStyle(
                  fontSize: 16.0.w,
                  fontWeight: FontWeight.w600,
                  color: kcVeryLightGrey),
            ),
            SfSlider(
                min: 0.toDouble(),
                max: 20.toDouble(),
                value: viewModel.longBreak,
                interval: 5,
                stepSize: 5,
                showLabels: true,
                activeColor: kcLightBlue,
                inactiveColor: kcTextFieldBackgroundColor,
                onChanged: (dynamic value) {
                  viewModel.getLongBreak(value);
                }),
          ],
        )),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0.w,
          vertical: 24.0.h,
        ),
        child: SizedBox(
          width: screenWidth(context),
          child: ElevatedButton(
            onPressed: () {
              // Add your button action here
              if (titleController.text.isEmpty) {
                viewModel.changeValidity();
              } else {
                print(viewModel.longBreak);
                viewModel.navigationService.navigateToSessionView(
                  title: titleController.text,
                  workDuration: 10,
                  breakDuration: viewModel.shortBreak,
                  totalSessions: viewModel.sessions,
                  longBreakDuration: viewModel.longBreak,
                );
                viewModel.reset();
                titleController.clear();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kcLightBlue, // Custom background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0.w), // Border radius
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0.w,
                vertical: 12.0.h,
              ),
              child: Text(
                'بسم الله',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black, // Text color
                  fontSize: 18.0.w,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
