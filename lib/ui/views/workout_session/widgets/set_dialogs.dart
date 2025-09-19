import 'package:flutter/material.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/app_strings.dart';
import '../workout_session_viewmodel.dart';

class SetDialogs {
  static void showWeightDialog(
    BuildContext context, 
    WorkoutSessionViewModel viewModel, 
    int setIndex, 
    double currentWeight
  ) {
    final controller = TextEditingController(text: currentWeight.toInt().toString());
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit ${ksWeight}', style: AppTextStyles.textLgSemibold),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: '${ksWeight} (${ksKilograms})',
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(ksCancel, style: AppTextStyles.textBaseMedium),
          ),
          TextButton(
            onPressed: () {
              final weight = double.tryParse(controller.text) ?? currentWeight;
              viewModel.updateSetWeight(viewModel.currentExerciseIndex, setIndex, weight);
              Navigator.pop(context);
            },
            child: Text(ksSave, style: AppTextStyles.textBaseSemibold),
          ),
        ],
      ),
    );
  }

  static void showRepsDialog(
    BuildContext context, 
    WorkoutSessionViewModel viewModel, 
    int setIndex, 
    int currentReps
  ) {
    final controller = TextEditingController(text: currentReps.toString());
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit ${ksReps}', style: AppTextStyles.textLgSemibold),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Repetitions',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(ksCancel, style: AppTextStyles.textBaseMedium),
          ),
          TextButton(
            onPressed: () {
              final reps = int.tryParse(controller.text) ?? currentReps;
              viewModel.updateSetReps(viewModel.currentExerciseIndex, setIndex, reps);
              Navigator.pop(context);
            },
            child: Text(ksSave, style: AppTextStyles.textBaseSemibold),
          ),
        ],
      ),
    );
  }

  static void showTenRepMaxDialog(
    BuildContext context, 
    WorkoutSessionViewModel viewModel, 
    int setIndex, 
    double currentTenRepMax
  ) {
    final controller = TextEditingController(text: currentTenRepMax.toString());
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit ${ksTenRepMax}', style: AppTextStyles.textLgSemibold),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: '${ksTenRepMax} (${ksKilograms})',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(ksCancel, style: AppTextStyles.textBaseMedium),
          ),
          TextButton(
            onPressed: () {
              final tenRepMax = double.tryParse(controller.text) ?? currentTenRepMax;
              viewModel.updateSetTenRepMax(viewModel.currentExerciseIndex, setIndex, tenRepMax);
              Navigator.pop(context);
            },
            child: const Text(ksSave, style: AppTextStyles.textBaseSemibold),
          ),
        ],
      ),
    );
  }
}
