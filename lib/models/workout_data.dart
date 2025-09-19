class WorkoutData {
  final String workoutName;
  final List<ExerciseData> exercises;

  WorkoutData({
    required this.workoutName,
    required this.exercises,
  });

  factory WorkoutData.fromJson(Map<String, dynamic> json) {
    return WorkoutData(
      workoutName: json['workout_name'] ?? '',
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((exercise) => ExerciseData.fromJson(exercise))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workout_name': workoutName,
      'exercises': exercises.map((exercise) => exercise.toJson()).toList(),
    };
  }
}

class ExerciseData {
  final String name;
  final String assetUrl;
  final String equipment;

  ExerciseData({
    required this.name,
    required this.assetUrl,
    required this.equipment,
  });

  factory ExerciseData.fromJson(Map<String, dynamic> json) {
    return ExerciseData(
      name: json['name'] ?? '',
      assetUrl: json['asset_url'] ?? '',
      equipment: json['equipment'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'asset_url': assetUrl,
      'equipment': equipment,
    };
  }
}
