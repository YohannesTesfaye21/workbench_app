// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;
import 'package:workbench_app/ui/views/exercise_detail/exercise_detail_view.dart'
    as _i6;
import 'package:workbench_app/ui/views/workout_list/workout_list_view.dart'
    as _i4;
import 'package:workbench_app/ui/views/workout_session/workout_session_view.dart'
    as _i5;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const workoutListView = '/workout-list-view';

  static const workoutSessionView = '/workout-session-view';

  static const exerciseDetailView = '/exercise-detail-view';

  static const all = <String>{
    homeView,
    startupView,
    workoutListView,
    workoutSessionView,
    exerciseDetailView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.workoutListView,
      page: _i4.WorkoutListView,
    ),
    _i1.RouteDef(
      Routes.workoutSessionView,
      page: _i5.WorkoutSessionView,
    ),
    _i1.RouteDef(
      Routes.exerciseDetailView,
      page: _i6.ExerciseDetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    // _i2.HomeView: (data) {
    //   return _i7.MaterialPageRoute<dynamic>(
    //     builder: (context) => const _i2.HomeView(),
    //     settings: data,
    //   );
    // },
    // _i3.StartupView: (data) {
    //   return _i7.MaterialPageRoute<dynamic>(
    //     builder: (context) => const _i3.StartupView(),
    //     settings: data,
    //   );
    // },
    _i4.WorkoutListView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.WorkoutListView(),
        settings: data,
      );
    },
    _i5.WorkoutSessionView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.WorkoutSessionView(),
        settings: data,
      );
    },
    _i6.ExerciseDetailView: (data) {
      final args = data.getArgs<ExerciseDetailViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.ExerciseDetailView(key: args.key, exerciseId: args.exerciseId),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ExerciseDetailViewArguments {
  const ExerciseDetailViewArguments({
    this.key,
    required this.exerciseId,
  });

  final _i7.Key? key;

  final String exerciseId;

  @override
  String toString() {
    return '{"key": "$key", "exerciseId": "$exerciseId"}';
  }

  @override
  bool operator ==(covariant ExerciseDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.exerciseId == exerciseId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ exerciseId.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
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

  Future<dynamic> navigateToWorkoutListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.workoutListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWorkoutSessionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.workoutSessionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToExerciseDetailView({
    _i7.Key? key,
    required String exerciseId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.exerciseDetailView,
        arguments:
            ExerciseDetailViewArguments(key: key, exerciseId: exerciseId),
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

  Future<dynamic> replaceWithWorkoutListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.workoutListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWorkoutSessionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.workoutSessionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithExerciseDetailView({
    _i7.Key? key,
    required String exerciseId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.exerciseDetailView,
        arguments:
            ExerciseDetailViewArguments(key: key, exerciseId: exerciseId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
