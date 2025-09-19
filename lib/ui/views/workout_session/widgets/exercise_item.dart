import 'package:flutter/material.dart';
import '../../../common/app_assets.dart';
import '../../../common/app_colors.dart';
import '../workout_session_viewmodel.dart';

class ExerciseItem extends StatelessWidget {
  final dynamic exercise;
  final int index;
  final bool isCurrent;
  final bool isCompleted;
  final WorkoutSessionViewModel viewModel;
  final VoidCallback onEnterEditMode;

  const ExerciseItem({
    Key? key,
    required this.exercise,
    required this.index,
    required this.isCurrent,
    required this.isCompleted,
    required this.viewModel,
    required this.onEnterEditMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => viewModel.selectExercise(index),
      onLongPress: onEnterEditMode,
      onDoubleTap: () => viewModel.toggleExerciseCompletion(index),
      child: Container(
        key: ValueKey(exercise.id),
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isCurrent
                        ? Border.all(color: kcPrimaryColor, width: 2)
                        : null,
                    color: isCompleted ? kcSuccessColor : kcCardBackground,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      exercise.assetUrl.isNotEmpty ? exercise.assetUrl : AppAssets.getExerciseImage(exercise.name),
                      fit: BoxFit.cover,
                      width: 64,
                      height: 64,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildExerciseIcon(exercise.name);
                      },
                    ),
                  ),
                ),
                if (isCompleted)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: kcPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  )
                else if (isCurrent)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: kcPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseIcon(String exerciseName, {double size = 40}) {
    return Center(
      child: Icon(
        _getExerciseIcon(exerciseName),
        size: size,
        color: kcTextSecondary,
      ),
    );
  }

  IconData _getExerciseIcon(String exerciseName) {
    final name = exerciseName.toLowerCase();
    if (name.contains('squat')) return Icons.fitness_center;
    if (name.contains('press')) return Icons.fitness_center;
    if (name.contains('pull')) return Icons.fitness_center;
    if (name.contains('curl')) return Icons.fitness_center;
    if (name.contains('extension')) return Icons.fitness_center;
    return Icons.fitness_center;
  }
}

class EditableExerciseItem extends StatelessWidget {
  final dynamic exercise;
  final int index;
  final WorkoutSessionViewModel viewModel;

  const EditableExerciseItem({
    Key? key,
    required this.exercise,
    required this.index,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(exercise.id),
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kcCardBackground,
                ),
                child: ClipOval(
                  child: Image.asset(
                    exercise.assetUrl.isNotEmpty ? exercise.assetUrl : AppAssets.getExerciseImage(exercise.name),
                    fit: BoxFit.cover,
                    width: 64,
                    height: 64,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildExerciseIcon(exercise.name);
                    },
                  ),
                ),
              ),
              // Remove button
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => viewModel.removeExercise(index),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildExerciseIcon(String exerciseName, {double size = 40}) {
    return Center(
      child: Icon(
        _getExerciseIcon(exerciseName),
        size: size,
        color: kcTextSecondary,
      ),
    );
  }

  IconData _getExerciseIcon(String exerciseName) {
    final name = exerciseName.toLowerCase();
    if (name.contains('squat')) return Icons.fitness_center;
    if (name.contains('press')) return Icons.fitness_center;
    if (name.contains('pull')) return Icons.fitness_center;
    if (name.contains('curl')) return Icons.fitness_center;
    if (name.contains('extension')) return Icons.fitness_center;
    return Icons.fitness_center;
  }
}
