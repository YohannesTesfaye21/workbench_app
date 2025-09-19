class AppAssets {
  // Exercise Images
  static const String squat = 'assets/excersice_images/squat.png';
  static const String benchPress = 'assets/excersice_images/bench_press.png';
  static const String pullUps = 'assets/excersice_images/pull_ups.png';
  static const String shoulderPress = 'assets/excersice_images/shoulder_press.png';
  static const String tricepsCable = 'assets/excersice_images/triceps_cable.png';
  
  // Get exercise image by name
  static String getExerciseImage(String exerciseName) {
    final name = exerciseName.toLowerCase();
    if (name.contains('squat')) return squat;
    if (name.contains('bench') || name.contains('press')) return benchPress;
    if (name.contains('pull')) return pullUps;
    if (name.contains('shoulder')) return shoulderPress;
    if (name.contains('triceps') || name.contains('extension')) return tricepsCable;
    if (name.contains('curl') || name.contains('biceps')) return tricepsCable;
    return squat; // Default fallback
  }
  
  // Get equipment icon (placeholder - will use Material icons)
  static String getEquipmentIcon(String equipment) {
    // For now, return empty string to use Material icon fallback
    return '';
  }
}
