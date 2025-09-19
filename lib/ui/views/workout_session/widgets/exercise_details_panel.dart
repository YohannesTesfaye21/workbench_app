import 'package:flutter/material.dart';
import 'package:workbench_app/ui/common/app_strings.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/app_assets.dart';
import '../../../common/ui_helpers.dart';
import '../../../common/app_colors.dart';
import '../workout_session_viewmodel.dart';
import 'action_buttons.dart';
import 'sets_section.dart';

class ExerciseDetailsPanel extends StatelessWidget {
  final WorkoutSessionViewModel viewModel;
  final bool isEditMode;

  const ExerciseDetailsPanel({
    Key? key,
    required this.viewModel,
    required this.isEditMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (viewModel.currentExercise == null) {
      return const Center(
        child: Text(
          'Select an exercise',
          style: TextStyle(
            color: kcTextSecondary,
            fontSize: 18,
          ),
        ),
      );
    }

    final exercise = viewModel.currentExercise!;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: getMobilePadding(context),
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildExerciseCard(context, exercise),
          if (isEditMode) ...[
            const SizedBox(height: 16),
            SetsSection(viewModel: viewModel),
          ],
        ],
      ),
    );
  }

  Widget _buildExerciseCard(BuildContext context, exercise) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kcBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: kcCardBackground,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  exercise.name,
                  style: AppTextStyles.textXlSemibold.copyWith(
                    color: kcTextPrimary,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: kcPrimaryColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child:  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.swap_horiz, color: kcTextPrimary, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      ksReplaceExercise,
                      style: AppTextStyles.textSmSemibold.copyWith(
                        color: kcTextPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: kcCardBackground,
                  width: 2,
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    exercise.assetUrl.isNotEmpty ? exercise.assetUrl : AppAssets.getExerciseImage(exercise.name),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildExerciseIcon(exercise.name, size: 80);
                    },
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE0E0E0),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.rotate(
                            angle: 0.3, // Diagonal rotation for the icon only
                            child: Icon(
                              _getEquipmentIcon(exercise.equipment),
                              color: kcDarkGreyColor,
                              size: 14,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            exercise.equipment,
                            style: AppTextStyles.textSmSemibold.copyWith(
                              color: kcDarkGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const ActionButtons(),
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

  IconData _getEquipmentIcon(String equipment) {
    if (equipment.toLowerCase().contains('dumbbell')) return Icons.fitness_center;
    if (equipment.toLowerCase().contains('barbell')) return Icons.fitness_center;
    if (equipment.toLowerCase().contains('cable')) return Icons.fitness_center;
    return Icons.fitness_center;
  }
}
