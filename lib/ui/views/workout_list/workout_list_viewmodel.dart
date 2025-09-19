import 'package:stacked/stacked.dart';
import 'package:workbench_app/models/workout.dart';
import 'package:workbench_app/services/workout_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workbench_app/app/app.locator.dart';
import 'package:workbench_app/app/app.router.dart';

class WorkoutListViewModel extends BaseViewModel {
  final WorkoutService _workoutService = WorkoutService();
  final NavigationService _navigationService = locator<NavigationService>();

  List<Workout> _workouts = [];
  List<Workout> get workouts => _workouts;

  Future<void> onViewModelReady() async {
    await loadWorkouts();
  }

  Future<void> loadWorkouts() async {
    setBusy(true);
    try {
      _workouts = await _workoutService.getWorkouts();
      notifyListeners();
    } catch (e) {
      // Handle error
    } finally {
      setBusy(false);
    }
  }

  Future<void> startWorkout(String workoutId) async {
    _navigationService.navigateTo(Routes.workoutSessionView);
  }

  Future<void> createNewWorkout() async {
    // TODO: Navigate to create workout view
    // For now, just show a dialog
  }

  Future<void> editWorkout(String workoutId) async {
    // TODO: Navigate to edit workout view
    // For now, just show a dialog
  }

  Future<void> deleteWorkout(String workoutId) async {
    try {
      await _workoutService.deleteWorkout(workoutId);
      await loadWorkouts();
    } catch (e) {
      // Handle error
    }
  }
}
