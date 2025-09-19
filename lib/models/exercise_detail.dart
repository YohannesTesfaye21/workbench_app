class ExerciseDetail {
  final String id;
  final String name;
  final String description;
  final String category;
  final String equipment;
  final String difficulty;
  final String muscleGroup;
  final List<String> primaryMuscles;
  final List<String> secondaryMuscles;
  final List<String> instructions;
  final List<String> tips;
  final List<String> warnings;
  final String imageUrl;
  final String videoUrl;
  final List<ExerciseVariation> variations;
  final List<ExerciseProgression> progressions;
  final ExerciseMetrics metrics;
  final bool isBodyweight;
  final bool requiresEquipment;
  final int estimatedDuration; // in seconds
  final int restTime; // in seconds
  final String notes;

  ExerciseDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.equipment,
    required this.difficulty,
    required this.muscleGroup,
    required this.primaryMuscles,
    required this.secondaryMuscles,
    required this.instructions,
    required this.tips,
    required this.warnings,
    required this.imageUrl,
    required this.videoUrl,
    required this.variations,
    required this.progressions,
    required this.metrics,
    required this.isBodyweight,
    required this.requiresEquipment,
    required this.estimatedDuration,
    required this.restTime,
    required this.notes,
  });

  factory ExerciseDetail.fromJson(Map<String, dynamic> json) {
    return ExerciseDetail(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      equipment: json['equipment'] ?? '',
      difficulty: json['difficulty'] ?? 'beginner',
      muscleGroup: json['muscleGroup'] ?? '',
      primaryMuscles: List<String>.from(json['primaryMuscles'] ?? []),
      secondaryMuscles: List<String>.from(json['secondaryMuscles'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
      tips: List<String>.from(json['tips'] ?? []),
      warnings: List<String>.from(json['warnings'] ?? []),
      imageUrl: json['imageUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      variations: (json['variations'] as List<dynamic>?)
          ?.map((v) => ExerciseVariation.fromJson(v))
          .toList() ?? [],
      progressions: (json['progressions'] as List<dynamic>?)
          ?.map((p) => ExerciseProgression.fromJson(p))
          .toList() ?? [],
      metrics: ExerciseMetrics.fromJson(json['metrics'] ?? {}),
      isBodyweight: json['isBodyweight'] ?? false,
      requiresEquipment: json['requiresEquipment'] ?? true,
      estimatedDuration: json['estimatedDuration'] ?? 0,
      restTime: json['restTime'] ?? 60,
      notes: json['notes'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'equipment': equipment,
      'difficulty': difficulty,
      'muscleGroup': muscleGroup,
      'primaryMuscles': primaryMuscles,
      'secondaryMuscles': secondaryMuscles,
      'instructions': instructions,
      'tips': tips,
      'warnings': warnings,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'variations': variations.map((v) => v.toJson()).toList(),
      'progressions': progressions.map((p) => p.toJson()).toList(),
      'metrics': metrics.toJson(),
      'isBodyweight': isBodyweight,
      'requiresEquipment': requiresEquipment,
      'estimatedDuration': estimatedDuration,
      'restTime': restTime,
      'notes': notes,
    };
  }
}

class ExerciseVariation {
  final String id;
  final String name;
  final String description;
  final String difficulty;
  final String imageUrl;
  final String videoUrl;
  final List<String> instructions;
  final List<String> tips;

  ExerciseVariation({
    required this.id,
    required this.name,
    required this.description,
    required this.difficulty,
    required this.imageUrl,
    required this.videoUrl,
    required this.instructions,
    required this.tips,
  });

  factory ExerciseVariation.fromJson(Map<String, dynamic> json) {
    return ExerciseVariation(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      difficulty: json['difficulty'] ?? 'beginner',
      imageUrl: json['imageUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      instructions: List<String>.from(json['instructions'] ?? []),
      tips: List<String>.from(json['tips'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'difficulty': difficulty,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'instructions': instructions,
      'tips': tips,
    };
  }
}

class ExerciseProgression {
  final String id;
  final String name;
  final String description;
  final String difficulty;
  final String imageUrl;
  final String videoUrl;
  final List<String> instructions;
  final List<String> tips;
  final Map<String, dynamic> requirements;

  ExerciseProgression({
    required this.id,
    required this.name,
    required this.description,
    required this.difficulty,
    required this.imageUrl,
    required this.videoUrl,
    required this.instructions,
    required this.tips,
    required this.requirements,
  });

  factory ExerciseProgression.fromJson(Map<String, dynamic> json) {
    return ExerciseProgression(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      difficulty: json['difficulty'] ?? 'beginner',
      imageUrl: json['imageUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      instructions: List<String>.from(json['instructions'] ?? []),
      tips: List<String>.from(json['tips'] ?? []),
      requirements: Map<String, dynamic>.from(json['requirements'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'difficulty': difficulty,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'instructions': instructions,
      'tips': tips,
      'requirements': requirements,
    };
  }
}

class ExerciseMetrics {
  final double caloriesPerMinute;
  final double metValue;
  final double heartRateZone;
  final double difficultyRating;
  final double effectivenessRating;
  final Map<String, dynamic> biomechanics;
  final Map<String, dynamic> performance;

  ExerciseMetrics({
    required this.caloriesPerMinute,
    required this.metValue,
    required this.heartRateZone,
    required this.difficultyRating,
    required this.effectivenessRating,
    required this.biomechanics,
    required this.performance,
  });

  factory ExerciseMetrics.fromJson(Map<String, dynamic> json) {
    return ExerciseMetrics(
      caloriesPerMinute: (json['caloriesPerMinute'] ?? 0.0).toDouble(),
      metValue: (json['metValue'] ?? 0.0).toDouble(),
      heartRateZone: (json['heartRateZone'] ?? 0.0).toDouble(),
      difficultyRating: (json['difficultyRating'] ?? 0.0).toDouble(),
      effectivenessRating: (json['effectivenessRating'] ?? 0.0).toDouble(),
      biomechanics: Map<String, dynamic>.from(json['biomechanics'] ?? {}),
      performance: Map<String, dynamic>.from(json['performance'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'caloriesPerMinute': caloriesPerMinute,
      'metValue': metValue,
      'heartRateZone': heartRateZone,
      'difficultyRating': difficultyRating,
      'effectivenessRating': effectivenessRating,
      'biomechanics': biomechanics,
      'performance': performance,
    };
  }
}
