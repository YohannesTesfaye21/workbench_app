import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../app/app.locator.dart';
import '../../../models/workout.dart';
import '../../../models/workout_session.dart';

class WorkoutSessionViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<Exercise> _exercises = [];
  WorkoutSession? _workoutSession;
  int _currentExerciseIndex = 0;
  final DateTime _sessionStartTime = DateTime.now();
  List<Exercise> _originalExercises = [];

  // Getters
  List<Exercise> get exercises => _exercises;
  WorkoutSession? get workoutSession => _workoutSession;
  Exercise? get currentExercise => _exercises.isNotEmpty && _currentExerciseIndex < _exercises.length 
      ? _exercises[_currentExerciseIndex] 
      : null;
  int get currentExerciseIndex => _currentExerciseIndex;
  bool get hasChanges => _hasActualChanges();

  bool _hasActualChanges() {
    
    if (_originalExercises.length != _exercises.length) {
      return true;
    }
    
    for (int i = 0; i < _exercises.length; i++) {
      if (i >= _originalExercises.length) {
        return true;
      }
      
      final current = _exercises[i];
      final original = _originalExercises[i];
      
      // Check if exercise properties have changed
      if (current.id != original.id ||
          current.name != original.name ||
          current.isCompleted != original.isCompleted ||
          current.sets.length != original.sets.length) {
        return true;
      }
      
      // Check if sets have changed
      for (int j = 0; j < current.sets.length; j++) {
        if (j >= original.sets.length) {
          return true;
        }
        
        final currentSet = current.sets[j];
        final originalSet = original.sets[j];
        
        if (currentSet.weight != originalSet.weight ||
            currentSet.reps != originalSet.reps ||
            currentSet.tenRepMax != originalSet.tenRepMax ||
            currentSet.isCompleted != originalSet.isCompleted) {
          return true;
        }
      }
    }
    
    return false;
  }

  String get formattedDuration {
    final duration = DateTime.now().difference(_sessionStartTime);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  Future<void> onViewModelReady() async {
    // Add a small delay to ensure the view is ready
    await Future.delayed(const Duration(milliseconds: 100));
    await _initializeWorkoutSession();
  }

  Future<void> _initializeWorkoutSession() async {
    setBusy(true);
    try {
      // Try to load from local storage first
      await _loadExercisesFromLocalStorage();
      
      // If no saved data, create mock exercises
      if (_exercises.isEmpty) {
        _exercises = _createMockExercises();
      }
      
      _workoutSession = WorkoutSession(
        id: 'session_1',
        workoutId: 'workout_1',
        startTime: _sessionStartTime,
        exerciseSessions: _exercises.map((exercise) => ExerciseSession(
          id: 'exercise_session_${exercise.id}',
          exerciseId: exercise.id,
          startTime: DateTime.now(),
          setSessions: exercise.sets.map((set) => SetSession(
            id: 'set_session_${set.id}',
            setNumber: set.setNumber,
            weight: set.weight,
            reps: set.reps,
            tenRepMax: set.tenRepMax,
          )).toList(),
        )).toList(),
      );
      notifyListeners();
    } catch (e) {
      // Error loading exercises from local storage, will use mock data
    } finally {
      setBusy(false);
    }
  }

  List<Exercise> _createMockExercises() {
    // Create exercises with local asset references
    final exercises = [
      {
        "name": "Squat",
        "equipment": "barbell"
      },
      {
        "name": "Inclined Bench Press", 
        "equipment": "barbell"
      },
      {
        "name": "Pull Ups",
        "equipment": "bodyweight"
      },
      {
        "name": "Shoulder Press",
        "equipment": "dumbbell"
      },
      {
        "name": "Curl Biceps",
        "equipment": "cable"
      },
      {
        "name": "Extension Triceps",
        "equipment": "cable"
      }
    ];

    // Convert to Exercise model
    return exercises.asMap().entries.map((entry) {
      final index = entry.key;
      final exerciseData = entry.value;
      
      return Exercise(
        id: 'ex_${index + 1}',
        name: exerciseData["name"]!,
        description: _getExerciseDescription(exerciseData["name"]!),
        equipment: exerciseData["equipment"]!,
        muscleGroup: _getMuscleGroup(exerciseData["name"]!),
        imageUrl: '', // Not used with local assets
        assetUrl: _getAssetUrl(exerciseData["name"]!),
        sets: _getDefaultSets(exerciseData["name"]!, index + 1),
        isCompleted: index < 2, // First two exercises are completed
      );
    }).toList();
  }

  String _getExerciseDescription(String exerciseName) {
    final name = exerciseName.toLowerCase();
    if (name.contains('squat')) return 'A compound exercise that targets the quadriceps, hamstrings, and glutes.';
    if (name.contains('press')) return 'A pushing exercise that targets the chest, shoulders, and triceps.';
    if (name.contains('pull')) return 'A pulling exercise that targets the back and biceps.';
    if (name.contains('curl')) return 'An isolation exercise that targets the biceps.';
    if (name.contains('extension')) return 'An isolation exercise that targets the triceps.';
    return 'A great exercise for building strength and muscle.';
  }

  String _getMuscleGroup(String exerciseName) {
    final name = exerciseName.toLowerCase();
    if (name.contains('squat')) return 'Legs';
    if (name.contains('press')) return 'Chest';
    if (name.contains('pull')) return 'Back';
    if (name.contains('curl')) return 'Arms';
    if (name.contains('extension')) return 'Arms';
    return 'Full Body';
  }

  String _getAssetUrl(String exerciseName) {
    final name = exerciseName.toLowerCase();
    if (name.contains('squat')) return 'assets/excersice_images/squat.png';
    if (name.contains('bench') || name.contains('press')) return 'assets/excersice_images/bench_press.png';
    if (name.contains('pull')) return 'assets/excersice_images/pull_ups.png';
    if (name.contains('shoulder')) return 'assets/excersice_images/shoulder_press.png';
    if (name.contains('triceps') || name.contains('extension')) return 'assets/excersice_images/triceps_cable.png';
    if (name.contains('curl') || name.contains('biceps')) return 'assets/excersice_images/triceps_cable.png';
    return 'assets/excersice_images/squat.png'; // Default fallback
  }

  List<ExerciseSet> _getDefaultSets(String exerciseName, int exerciseNumber) {
    return List.generate(3, (index) {
      return ExerciseSet(
        id: 'set_${exerciseNumber}_${index + 1}',
        setNumber: index + 1,
        weight: 25.0 + (index * 5.0),
        reps: 12 - (index * 2),
        tenRepMax: 30.0 + (index * 5.0),
        isCompleted: exerciseNumber <= 2 && index == 0, // First set of first two exercises is completed
      );
    });
  }

  void selectExercise(int index) {
    if (index >= 0 && index < _exercises.length) {
      _currentExerciseIndex = index;
      notifyListeners();
    }
  }


  void reorderExercises(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    
    final exercise = _exercises.removeAt(oldIndex);
    _exercises.insert(newIndex, exercise);
    
    // Update current exercise index if needed
    if (_currentExerciseIndex == oldIndex) {
      _currentExerciseIndex = newIndex;
    } else if (_currentExerciseIndex > oldIndex && _currentExerciseIndex <= newIndex) {
      _currentExerciseIndex--;
    } else if (_currentExerciseIndex < oldIndex && _currentExerciseIndex >= newIndex) {
      _currentExerciseIndex++;
    }
    
    notifyListeners();
  }

  void removeExercise(int index) {
    if (index >= 0 && index < _exercises.length) {
      _exercises.removeAt(index);
      
      // Adjust current exercise index
      if (_currentExerciseIndex >= index) {
        _currentExerciseIndex = (_currentExerciseIndex - 1).clamp(0, _exercises.length - 1);
      }
      
      notifyListeners();
    }
  }

  void addExercise() {
    // For now, add a placeholder exercise
    // In a real app, this would open a selection screen
    final newExercise = Exercise(
      id: 'ex_${_exercises.length + 1}',
      name: 'New Exercise',
      description: 'A new exercise to add to your workout',
      equipment: 'bodyweight',
      muscleGroup: 'Full Body',
      imageUrl: '',
      assetUrl: '',
      sets: _getDefaultSets('New Exercise', _exercises.length + 1),
    );
    
    _exercises.add(newExercise);
    notifyListeners();
  }

  void setOriginalExercises() {
    _originalExercises = List.from(_exercises);
  }

  void saveChanges() async {
    try {
      // Save changes to local storage
      await _saveExercisesToLocalStorage();
      _originalExercises = List.from(_exercises);
      notifyListeners();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _saveExercisesToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Convert exercises to JSON
    final exercisesJson = _exercises.map((exercise) => {
      'id': exercise.id,
      'name': exercise.name,
      'description': exercise.description,
      'equipment': exercise.equipment,
      'muscleGroup': exercise.muscleGroup,
      'imageUrl': exercise.imageUrl,
      'assetUrl': exercise.assetUrl,
      'isCompleted': exercise.isCompleted,
      'restTimeSeconds': exercise.restTimeSeconds,
      'sets': exercise.sets.map((set) => {
        'id': set.id,
        'setNumber': set.setNumber,
        'weight': set.weight,
        'reps': set.reps,
        'tenRepMax': set.tenRepMax,
        'isCompleted': set.isCompleted,
      }).toList(),
    }).toList();
    
    // Save to SharedPreferences
    await prefs.setString('workout_exercises', jsonEncode(exercisesJson));
  }

  Future<void> _loadExercisesFromLocalStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final exercisesJsonString = prefs.getString('workout_exercises');
      
      if (exercisesJsonString != null) {
        final exercisesJson = jsonDecode(exercisesJsonString) as List;
        _exercises = exercisesJson.map((exerciseData) {
          return Exercise(
            id: exerciseData['id'] ?? '',
            name: exerciseData['name'] ?? '',
            description: exerciseData['description'] ?? '',
            equipment: exerciseData['equipment'] ?? '',
            muscleGroup: exerciseData['muscleGroup'] ?? '',
            imageUrl: exerciseData['imageUrl'] ?? '',
            assetUrl: exerciseData['assetUrl'] ?? '',
            isCompleted: exerciseData['isCompleted'] ?? false,
            restTimeSeconds: exerciseData['restTimeSeconds'],
            sets: (exerciseData['sets'] as List?)?.map((setData) {
              return ExerciseSet(
                id: setData['id'] ?? '',
                setNumber: setData['setNumber'] ?? 1,
                weight: setData['weight']?.toDouble() ?? 0.0,
                reps: setData['reps'] ?? 0,
                tenRepMax: setData['tenRepMax']?.toDouble() ?? 0.0,
                isCompleted: setData['isCompleted'] ?? false,
              );
            }).toList() ?? [],
          );
        }).toList();
        
        notifyListeners();
      }
    } catch (e) {
      // Error loading exercises from local storage
    }
  }

  void discardChanges() {
    _exercises = List.from(_originalExercises);
    notifyListeners();
  }

  void goBack() {
    _navigationService.back();
  }

  // Set management methods
  void toggleSetCompletion(int exerciseIndex, int setIndex) {
    if (exerciseIndex >= 0 && exerciseIndex < _exercises.length) {
      final exercise = _exercises[exerciseIndex];
      final updatedSets = List<ExerciseSet>.from(exercise.sets);
      
      if (setIndex >= 0 && setIndex < updatedSets.length) {
        updatedSets[setIndex] = updatedSets[setIndex].copyWith(
          isCompleted: !updatedSets[setIndex].isCompleted,
        );
        
        _exercises[exerciseIndex] = exercise.copyWith(sets: updatedSets);
        notifyListeners();
      }
    }
  }

  void toggleExerciseCompletion(int exerciseIndex) {
    if (exerciseIndex >= 0 && exerciseIndex < _exercises.length) {
      final exercise = _exercises[exerciseIndex];
      _exercises[exerciseIndex] = exercise.copyWith(
        isCompleted: !exercise.isCompleted,
      );
      notifyListeners();
    }
  }

  void addSetToExercise(int exerciseIndex) {
    if (exerciseIndex >= 0 && exerciseIndex < _exercises.length) {
      final exercise = _exercises[exerciseIndex];
      final newSet = ExerciseSet(
        id: 'set_${exercise.sets.length + 1}',
        setNumber: exercise.sets.length + 1,
        weight: 25.0,
        reps: 12,
        tenRepMax: 30.0,
        isCompleted: false,
      );
      
      final updatedSets = List<ExerciseSet>.from(exercise.sets)..add(newSet);
      _exercises[exerciseIndex] = exercise.copyWith(sets: updatedSets);
      notifyListeners();
    }
  }

  void updateSetWeight(int exerciseIndex, int setIndex, double weight) {
    if (exerciseIndex >= 0 && exerciseIndex < _exercises.length) {
      final exercise = _exercises[exerciseIndex];
      final updatedSets = List<ExerciseSet>.from(exercise.sets);
      
      if (setIndex >= 0 && setIndex < updatedSets.length) {
        updatedSets[setIndex] = updatedSets[setIndex].copyWith(weight: weight);
        _exercises[exerciseIndex] = exercise.copyWith(sets: updatedSets);
        notifyListeners();
      }
    }
  }

  void updateSetReps(int exerciseIndex, int setIndex, int reps) {
    if (exerciseIndex >= 0 && exerciseIndex < _exercises.length) {
      final exercise = _exercises[exerciseIndex];
      final updatedSets = List<ExerciseSet>.from(exercise.sets);
      
      if (setIndex >= 0 && setIndex < updatedSets.length) {
        updatedSets[setIndex] = updatedSets[setIndex].copyWith(reps: reps);
        _exercises[exerciseIndex] = exercise.copyWith(sets: updatedSets);
        notifyListeners();
      }
    }
  }

  void updateSetTenRepMax(int exerciseIndex, int setIndex, double tenRepMax) {
    if (exerciseIndex >= 0 && exerciseIndex < _exercises.length) {
      final exercise = _exercises[exerciseIndex];
      final updatedSets = List<ExerciseSet>.from(exercise.sets);
      
      if (setIndex >= 0 && setIndex < updatedSets.length) {
        updatedSets[setIndex] = updatedSets[setIndex].copyWith(tenRepMax: tenRepMax);
        _exercises[exerciseIndex] = exercise.copyWith(sets: updatedSets);
        notifyListeners();
      }
    }
  }

  void removeSetFromExercise(int exerciseIndex, int setIndex) {
    if (exerciseIndex >= 0 && exerciseIndex < _exercises.length) {
      final exercise = _exercises[exerciseIndex];
      final updatedSets = List<ExerciseSet>.from(exercise.sets);
      
      if (setIndex >= 0 && setIndex < updatedSets.length) {
        updatedSets.removeAt(setIndex);
        // Update set numbers
        for (int i = 0; i < updatedSets.length; i++) {
          updatedSets[i] = updatedSets[i].copyWith(setNumber: i + 1);
        }
        
        _exercises[exerciseIndex] = exercise.copyWith(sets: updatedSets);
        notifyListeners();
      }
    }
  }
}