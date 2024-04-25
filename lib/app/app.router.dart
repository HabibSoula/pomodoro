// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:pomo/ui/views/home/home_view.dart' as _i2;
import 'package:pomo/ui/views/session/session_view.dart' as _i4;
import 'package:pomo/ui/views/startup/startup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const sessionView = '/session-view';

  static const all = <String>{
    homeView,
    startupView,
    sessionView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.sessionView,
      page: _i4.SessionView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.SessionView: (data) {
      final args = data.getArgs<SessionViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.SessionView(
            key: args.key,
            title: args.title,
            workDuration: args.workDuration,
            breakDuration: args.breakDuration,
            totalSessions: args.totalSessions,
            longBreakDuration: args.longBreakDuration,
            doneSessions: args.doneSessions),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SessionViewArguments {
  const SessionViewArguments({
    this.key,
    required this.title,
    required this.workDuration,
    required this.breakDuration,
    required this.totalSessions,
    required this.longBreakDuration,
    this.doneSessions,
  });

  final _i5.Key? key;

  final String title;

  final int workDuration;

  final int breakDuration;

  final int totalSessions;

  final int longBreakDuration;

  final int? doneSessions;

  @override
  String toString() {
    return '{"key": "$key", "title": "$title", "workDuration": "$workDuration", "breakDuration": "$breakDuration", "totalSessions": "$totalSessions", "longBreakDuration": "$longBreakDuration", "doneSessions": "$doneSessions"}';
  }

  @override
  bool operator ==(covariant SessionViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.title == title &&
        other.workDuration == workDuration &&
        other.breakDuration == breakDuration &&
        other.totalSessions == totalSessions &&
        other.longBreakDuration == longBreakDuration &&
        other.doneSessions == doneSessions;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        title.hashCode ^
        workDuration.hashCode ^
        breakDuration.hashCode ^
        totalSessions.hashCode ^
        longBreakDuration.hashCode ^
        doneSessions.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSessionView({
    _i5.Key? key,
    required String title,
    required int workDuration,
    required int breakDuration,
    required int totalSessions,
    required int longBreakDuration,
    int? doneSessions,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.sessionView,
        arguments: SessionViewArguments(
            key: key,
            title: title,
            workDuration: workDuration,
            breakDuration: breakDuration,
            totalSessions: totalSessions,
            longBreakDuration: longBreakDuration,
            doneSessions: doneSessions),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSessionView({
    _i5.Key? key,
    required String title,
    required int workDuration,
    required int breakDuration,
    required int totalSessions,
    required int longBreakDuration,
    int? doneSessions,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.sessionView,
        arguments: SessionViewArguments(
            key: key,
            title: title,
            workDuration: workDuration,
            breakDuration: breakDuration,
            totalSessions: totalSessions,
            longBreakDuration: longBreakDuration,
            doneSessions: doneSessions),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
