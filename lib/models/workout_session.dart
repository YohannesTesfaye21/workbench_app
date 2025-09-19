class WorkoutSession {
  final String id;
  final String workoutId;
  final DateTime startTime;
  final DateTime? endTime;
  final List<ExerciseSession> exerciseSessions;
  final bool isCompleted;
  final Duration? totalDuration;

  WorkoutSession({
    required this.id,
    required this.workoutId,
    required this.startTime,
    this.endTime,
    required this.exerciseSessions,
    this.isCompleted = false,
    this.totalDuration,
  });

  Duration get currentDuration {
    final end = endTime ?? DateTime.now();
    return end.difference(startTime);
  }

  WorkoutSession copyWith({
    String? id,
    String? workoutId,
    DateTime? startTime,
    DateTime? endTime,
    List<ExerciseSession>? exerciseSessions,
    bool? isCompleted,
    Duration? totalDuration,
  }) {
    return WorkoutSession(
      id: id ?? this.id,
      workoutId: workoutId ?? this.workoutId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      exerciseSessions: exerciseSessions ?? this.exerciseSessions,
      isCompleted: isCompleted ?? this.isCompleted,
      totalDuration: totalDuration ?? this.totalDuration,
    );
  }
}

class ExerciseSession {
  final String id;
  final String exerciseId;
  final DateTime startTime;
  final DateTime? endTime;
  final List<SetSession> setSessions;
  final bool isCompleted;

  ExerciseSession({
    required this.id,
    required this.exerciseId,
    required this.startTime,
    this.endTime,
    required this.setSessions,
    this.isCompleted = false,
  });

  Duration get currentDuration {
    final end = endTime ?? DateTime.now();
    return end.difference(startTime);
  }

  ExerciseSession copyWith({
    String? id,
    String? exerciseId,
    DateTime? startTime,
    DateTime? endTime,
    List<SetSession>? setSessions,
    bool? isCompleted,
  }) {
    return ExerciseSession(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      setSessions: setSessions ?? this.setSessions,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class SetSession {
  final String id;
  final int setNumber;
  final double? weight;
  final int? reps;
  final double? tenRepMax;
  final DateTime? completedAt;
  final bool isCompleted;

  SetSession({
    required this.id,
    required this.setNumber,
    this.weight,
    this.reps,
    this.tenRepMax,
    this.completedAt,
    this.isCompleted = false,
  });

  SetSession copyWith({
    String? id,
    int? setNumber,
    double? weight,
    int? reps,
    double? tenRepMax,
    DateTime? completedAt,
    bool? isCompleted,
  }) {
    return SetSession(
      id: id ?? this.id,
      setNumber: setNumber ?? this.setNumber,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      tenRepMax: tenRepMax ?? this.tenRepMax,
      completedAt: completedAt ?? this.completedAt,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
