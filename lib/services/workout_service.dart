import 'package:workbench_app/models/workout.dart';

class WorkoutService {
  // This would typically connect to a database or API
  // For now, we'll use mock data

  Future<List<Workout>> getWorkouts() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    return [
      Workout(
        id: 'workout_1',
        name: 'Chris\' Fullbody 1',
        description: 'A comprehensive full-body workout targeting all major muscle groups',
        exercises: _getMockExercises(),
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        lastPerformed: DateTime.now().subtract(const Duration(days: 2)),
        estimatedDuration: const Duration(minutes: 45),
      ),
      Workout(
        id: 'workout_2',
        name: 'Upper Body Strength',
        description: 'Focus on chest, back, shoulders, and arms',
        exercises: _getMockExercises(),
        createdAt: DateTime.now().subtract(const Duration(days: 14)),
        lastPerformed: DateTime.now().subtract(const Duration(days: 5)),
        estimatedDuration: const Duration(minutes: 60),
      ),
      Workout(
        id: 'workout_3',
        name: 'Leg Day',
        description: 'Intensive lower body workout',
        exercises: _getMockExercises(),
        createdAt: DateTime.now().subtract(const Duration(days: 21)),
        lastPerformed: DateTime.now().subtract(const Duration(days: 7)),
        estimatedDuration: const Duration(minutes: 50),
      ),
    ];
  }

  Future<Workout?> getWorkoutById(String id) async {
    final workouts = await getWorkouts();
    try {
      return workouts.firstWhere((workout) => workout.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> saveWorkout(Workout workout) async {
    // Save workout to database/API
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> updateWorkout(Workout workout) async {
    // Update workout in database/API
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> deleteWorkout(String workoutId) async {
    // Delete workout from database/API
    await Future.delayed(const Duration(milliseconds: 300));
  }

  List<Exercise> _getMockExercises() {
    return [
      Exercise(
        id: 'ex_1',
        name: 'Barbell Squat',
        description: 'Basic squat with barbell',
        equipment: 'Barbell',
        muscleGroup: 'Quadriceps',
        imageUrl: '',
        assetUrl: '',
        sets: [
          ExerciseSet(id: 'set_1_1', setNumber: 1, weight: 60, reps: 12, tenRepMax: 65),
          ExerciseSet(id: 'set_1_2', setNumber: 2, weight: 60, reps: 12, tenRepMax: 65),
        ],
      ),
      Exercise(
        id: 'ex_2',
        name: 'Pull-up',
        description: 'Bodyweight pull-up',
        equipment: 'Pull-up Bar',
        muscleGroup: 'Latissimus Dorsi',
        imageUrl: '',
        assetUrl: '',
        sets: [
          ExerciseSet(id: 'set_2_1', setNumber: 1, weight: 0, reps: 8, tenRepMax: 0),
          ExerciseSet(id: 'set_2_2', setNumber: 2, weight: 0, reps: 8, tenRepMax: 0),
        ],
      ),
      Exercise(
        id: 'ex_3',
        name: 'Inclined Bench Press',
        description: 'Dumbbell inclined bench press',
        equipment: 'Dumbbell',
        muscleGroup: 'Pectorals',
        imageUrl: '',
        assetUrl: '',
        sets: [
          ExerciseSet(id: 'set_3_1', setNumber: 1, weight: 25, reps: 12, tenRepMax: 27.5),
          ExerciseSet(id: 'set_3_2', setNumber: 2, weight: 25, reps: 12, tenRepMax: 27.5),
        ],
      ),
    ];
  }
}
