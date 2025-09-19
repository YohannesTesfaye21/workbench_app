import 'package:workbench_app/models/exercise_detail.dart';

class ExerciseService {
  // Mock data for demonstration - in production this would come from an API
  static final Map<String, ExerciseDetail> _exerciseDatabase = {
    'barbell_squat': ExerciseDetail(
      id: 'barbell_squat',
      name: 'Barbell Squat',
      description: 'A compound exercise that targets the quadriceps, hamstrings, and glutes. The barbell squat is one of the most effective exercises for building lower body strength and muscle mass.',
      category: 'strength',
      equipment: 'barbell',
      difficulty: 'intermediate',
      muscleGroup: 'legs',
      primaryMuscles: ['quadriceps', 'glutes', 'hamstrings'],
      secondaryMuscles: ['calves', 'core', 'lower_back'],
      instructions: [
        'Stand with your feet shoulder-width apart, toes slightly pointed out',
        'Position the barbell across your upper back, resting on your traps',
        'Keep your chest up, core tight, and back straight',
        'Lower your body by bending at the hips and knees',
        'Descend until your thighs are parallel to the floor',
        'Drive through your heels to return to the starting position',
        'Keep your knees in line with your toes throughout the movement'
      ],
      tips: [
        'Keep your weight on your heels',
        'Don\'t let your knees cave inward',
        'Maintain a neutral spine throughout',
        'Breathe in on the way down, out on the way up',
        'Start with lighter weights to perfect your form'
      ],
      warnings: [
        'Stop if you feel any pain in your knees or lower back',
        'Don\'t round your back during the movement',
        'Ensure proper warm-up before heavy lifting',
        'Use a spotter when lifting heavy weights'
      ],
      imageUrl: 'assets/images/exercises/barbell_squat.jpg',
      videoUrl: 'assets/videos/exercises/barbell_squat.mp4',
      variations: [
        ExerciseVariation(
          id: 'goblet_squat',
          name: 'Goblet Squat',
          description: 'A beginner-friendly squat variation using a dumbbell or kettlebell',
          difficulty: 'beginner',
          imageUrl: 'assets/images/exercises/goblet_squat.jpg',
          videoUrl: 'assets/videos/exercises/goblet_squat.mp4',
          instructions: [
            'Hold a dumbbell or kettlebell at chest level',
            'Stand with feet shoulder-width apart',
            'Lower into a squat position',
            'Return to standing position'
          ],
          tips: [
            'Keep the weight close to your chest',
            'Use this variation to learn proper squat form'
          ],
        ),
      ],
      progressions: [
        ExerciseProgression(
          id: 'bodyweight_squat',
          name: 'Bodyweight Squat',
          description: 'Start with bodyweight squats to build basic movement patterns',
          difficulty: 'beginner',
          imageUrl: 'assets/images/exercises/bodyweight_squat.jpg',
          videoUrl: 'assets/videos/exercises/bodyweight_squat.mp4',
          instructions: [
            'Stand with feet shoulder-width apart',
            'Lower into a squat position without weights',
            'Focus on proper form and depth'
          ],
          tips: [
            'Master this before adding weight',
            'Focus on full range of motion'
          ],
          requirements: {'minReps': 10, 'minSets': 3},
        ),
      ],
      metrics: ExerciseMetrics(
        caloriesPerMinute: 8.0,
        metValue: 5.0,
        heartRateZone: 0.7,
        difficultyRating: 7.0,
        effectivenessRating: 9.0,
        biomechanics: {
          'joints': ['hip', 'knee', 'ankle'],
          'movement_plane': 'sagittal',
          'force_vector': 'vertical'
        },
        performance: {
          'max_weight': 0.0,
          'personal_record': 0.0,
          'last_performed': null
        },
      ),
      isBodyweight: false,
      requiresEquipment: true,
      estimatedDuration: 300, // 5 minutes
      restTime: 120, // 2 minutes
      notes: 'Focus on proper form over heavy weight. This exercise is fundamental for lower body development.',
    ),
    'incline_bench_press': ExerciseDetail(
      id: 'incline_bench_press',
      name: 'Incline Bench Press',
      description: 'An upper body exercise that targets the upper chest, shoulders, and triceps. The incline angle places more emphasis on the upper pectorals compared to flat bench press.',
      category: 'strength',
      equipment: 'dumbbell',
      difficulty: 'intermediate',
      muscleGroup: 'chest',
      primaryMuscles: ['upper_chest', 'anterior_deltoids', 'triceps'],
      secondaryMuscles: ['lower_chest', 'serratus_anterior', 'core'],
      instructions: [
        'Set the bench to a 30-45 degree incline',
        'Sit on the bench and lean back against the pad',
        'Hold dumbbells at chest level with palms facing forward',
        'Press the weights up and slightly together',
        'Lower the weights with control to chest level',
        'Keep your core tight and feet flat on the floor',
        'Maintain a slight arch in your lower back'
      ],
      tips: [
        'Don\'t let the weights go too wide at the top',
        'Keep your shoulder blades retracted',
        'Control the weight on the way down',
        'Focus on squeezing your chest at the top',
        'Use a spotter for heavy weights'
      ],
      warnings: [
        'Stop if you feel shoulder pain',
        'Don\'t bounce the weights off your chest',
        'Keep your wrists straight',
        'Don\'t overextend your shoulders'
      ],
      imageUrl: 'assets/images/exercises/incline_bench_press.jpg',
      videoUrl: 'assets/videos/exercises/incline_bench_press.mp4',
      variations: [
        ExerciseVariation(
          id: 'incline_barbell_press',
          name: 'Incline Barbell Press',
          description: 'Same movement pattern but with a barbell instead of dumbbells',
          difficulty: 'intermediate',
          imageUrl: 'assets/images/exercises/incline_barbell_press.jpg',
          videoUrl: 'assets/videos/exercises/incline_barbell_press.mp4',
          instructions: [
            'Set the bench to 30-45 degree incline',
            'Lie back and unrack the barbell',
            'Lower to upper chest with control',
            'Press up to full extension'
          ],
          tips: [
            'Use a spotter for safety',
            'Keep your grip slightly wider than shoulder width'
          ],
        ),
      ],
      progressions: [
        ExerciseProgression(
          id: 'incline_push_ups',
          name: 'Incline Push-ups',
          description: 'Bodyweight version using an elevated surface',
          difficulty: 'beginner',
          imageUrl: 'assets/images/exercises/incline_push_ups.jpg',
          videoUrl: 'assets/videos/exercises/incline_push_ups.mp4',
          instructions: [
            'Place hands on an elevated surface',
            'Keep body straight and core tight',
            'Lower chest to the surface',
            'Push back up to starting position'
          ],
          tips: [
            'Start with a higher surface for easier progression',
            'Focus on full range of motion'
          ],
          requirements: {'minReps': 8, 'minSets': 3},
        ),
      ],
      metrics: ExerciseMetrics(
        caloriesPerMinute: 6.0,
        metValue: 4.0,
        heartRateZone: 0.6,
        difficultyRating: 6.0,
        effectivenessRating: 8.0,
        biomechanics: {
          'joints': ['shoulder', 'elbow'],
          'movement_plane': 'sagittal',
          'force_vector': 'horizontal'
        },
        performance: {
          'max_weight': 0.0,
          'personal_record': 0.0,
          'last_performed': null
        },
      ),
      isBodyweight: false,
      requiresEquipment: true,
      estimatedDuration: 240, // 4 minutes
      restTime: 90, // 1.5 minutes
      notes: 'Great for building upper chest strength and improving shoulder stability.',
    ),
    // Add more exercises as needed
  };

  Future<ExerciseDetail?> getExerciseById(String id) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _exerciseDatabase[id];
  }

  Future<List<ExerciseDetail>> getAllExercises() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _exerciseDatabase.values.toList();
  }

  Future<List<ExerciseDetail>> getExercisesByCategory(String category) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _exerciseDatabase.values
        .where((exercise) => exercise.category == category)
        .toList();
  }

  Future<List<ExerciseDetail>> getExercisesByMuscleGroup(String muscleGroup) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _exerciseDatabase.values
        .where((exercise) => exercise.muscleGroup == muscleGroup)
        .toList();
  }

  Future<List<ExerciseDetail>> searchExercises(String query) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    final lowercaseQuery = query.toLowerCase();
    return _exerciseDatabase.values
        .where((exercise) =>
            exercise.name.toLowerCase().contains(lowercaseQuery) ||
            exercise.description.toLowerCase().contains(lowercaseQuery) ||
            exercise.primaryMuscles.any((muscle) => muscle.toLowerCase().contains(lowercaseQuery)))
        .toList();
  }

  Future<List<ExerciseDetail>> getExercisesByDifficulty(String difficulty) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _exerciseDatabase.values
        .where((exercise) => exercise.difficulty == difficulty)
        .toList();
  }

  Future<List<ExerciseDetail>> getBodyweightExercises() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _exerciseDatabase.values
        .where((exercise) => exercise.isBodyweight)
        .toList();
  }
}
