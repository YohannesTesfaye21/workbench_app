class Workout {
  final String id;
  final String name;
  final String description;
  final List<Exercise> exercises;
  final DateTime createdAt;
  final DateTime? lastPerformed;
  final Duration? estimatedDuration;

  Workout({
    required this.id,
    required this.name,
    required this.description,
    required this.exercises,
    required this.createdAt,
    this.lastPerformed,
    this.estimatedDuration,
  });

  Workout copyWith({
    String? id,
    String? name,
    String? description,
    List<Exercise>? exercises,
    DateTime? createdAt,
    DateTime? lastPerformed,
    Duration? estimatedDuration,
  }) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      exercises: exercises ?? this.exercises,
      createdAt: createdAt ?? this.createdAt,
      lastPerformed: lastPerformed ?? this.lastPerformed,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
    );
  }
}

class Exercise {
  final String id;
  final String name;
  final String description;
  final String equipment;
  final String muscleGroup;
  final String imageUrl;
  final String assetUrl; // Static image URL
  final List<ExerciseSet> sets;
  final bool isCompleted;
  final int? restTimeSeconds;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.equipment,
    required this.muscleGroup,
    required this.imageUrl,
    required this.assetUrl,
    required this.sets,
    this.isCompleted = false,
    this.restTimeSeconds,
  });

  Exercise copyWith({
    String? id,
    String? name,
    String? description,
    String? equipment,
    String? muscleGroup,
    String? imageUrl,
    String? assetUrl,
    List<ExerciseSet>? sets,
    bool? isCompleted,
    int? restTimeSeconds,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      equipment: equipment ?? this.equipment,
      muscleGroup: muscleGroup ?? this.muscleGroup,
      imageUrl: imageUrl ?? this.imageUrl,
      assetUrl: assetUrl ?? this.assetUrl,
      sets: sets ?? this.sets,
      isCompleted: isCompleted ?? this.isCompleted,
      restTimeSeconds: restTimeSeconds ?? this.restTimeSeconds,
    );
  }
}

class ExerciseSet {
  final String id;
  final int setNumber;
  final double? weight; // in kg
  final int? reps;
  final double? tenRepMax;
  final bool isCompleted;
  final Duration? restTime;

  ExerciseSet({
    required this.id,
    required this.setNumber,
    this.weight,
    this.reps,
    this.tenRepMax,
    this.isCompleted = false,
    this.restTime,
  });

  ExerciseSet copyWith({
    String? id,
    int? setNumber,
    double? weight,
    int? reps,
    double? tenRepMax,
    bool? isCompleted,
    Duration? restTime,
  }) {
    return ExerciseSet(
      id: id ?? this.id,
      setNumber: setNumber ?? this.setNumber,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      tenRepMax: tenRepMax ?? this.tenRepMax,
      isCompleted: isCompleted ?? this.isCompleted,
      restTime: restTime ?? this.restTime,
    );
  }
}
