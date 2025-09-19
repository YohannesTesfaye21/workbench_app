import 'package:stacked/stacked.dart';
import 'package:workbench_app/models/exercise_detail.dart';
import 'package:workbench_app/services/exercise_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workbench_app/app/app.locator.dart';

class ExerciseDetailViewModel extends BaseViewModel {
  final String exerciseId;
  final ExerciseService _exerciseService = ExerciseService();
  final NavigationService _navigationService = locator<NavigationService>();

  ExerciseDetail? _exercise;
  bool _isFavorite = false;

  ExerciseDetail? get exercise => _exercise;
  bool get isFavorite => _isFavorite;

  ExerciseDetailViewModel(this.exerciseId);

  Future<void> onViewModelReady() async {
    await loadExercise();
  }

  Future<void> loadExercise() async {
    setBusy(true);
    try {
      _exercise = await _exerciseService.getExerciseById(exerciseId);
      notifyListeners();
    } catch (e) {
      // Handle error
    } finally {
      setBusy(false);
    }
  }

  void goBack() {
    _navigationService.back();
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  void showInstructions() {
    // This could show a modal with just the instructions
    // or navigate to a dedicated instructions view
  }

  void showWarmUp() {
    // This could show warm-up exercises for this specific exercise
  }

  void showFAQ() {
    // This could show frequently asked questions about this exercise
  }
}
