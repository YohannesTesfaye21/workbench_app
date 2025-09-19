import 'package:flutter/material.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/app_colors.dart';
import '../workout_session_viewmodel.dart';
import 'set_dialogs.dart';

class SetRow extends StatelessWidget {
  final dynamic set;
  final int index;
  final WorkoutSessionViewModel viewModel;

  const SetRow({
    Key? key,
    required this.set,
    required this.index,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCompleted = set.isCompleted;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isCompleted ? kcSetRowColor : kcLightGrey,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '${index + 1}',
              style: AppTextStyles.textSmSemibold.copyWith(
                color: kcTextPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => SetDialogs.showWeightDialog(
                context, 
                viewModel, 
                index, 
                set.weight ?? 0
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isCompleted ? kcPrimaryColor.withValues(alpha: 0.2) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isCompleted ? kcPrimaryColor : const Color(0xFFE0E0E0),
                    width: 1,
                  ),
                ),
                child: Text(
                  '${set.weight?.toInt() ?? 0}',
                  style: AppTextStyles.textSmSemibold.copyWith(
                    color: kcTextPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => SetDialogs.showRepsDialog(
                context, 
                viewModel, 
                index, 
                set.reps ?? 0
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isCompleted ? kcPrimaryColor.withValues(alpha: 0.2) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isCompleted ? kcPrimaryColor : const Color(0xFFE0E0E0),
                    width: 1,
                  ),
                ),
                child: Text(
                  '${set.reps ?? 0}',
                  style: AppTextStyles.textSmSemibold.copyWith(
                    color: kcTextPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => SetDialogs.showTenRepMaxDialog(
                context, 
                viewModel, 
                index, 
                set.tenRepMax ?? 0
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isCompleted ? kcCheckBorderColor : kcLightGrey,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isCompleted ? kcCheckBorderColor : const Color(0xFFE0E0E0),
                    width: 1,
                  ),
                ),
                child: Text(
                  '${set.tenRepMax?.toStringAsFixed(1) ?? '0.0'}',
                  style: AppTextStyles.textSmSemibold.copyWith(
                    color: kcTextPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => viewModel.toggleSetCompletion(viewModel.currentExerciseIndex, index),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isCompleted ? kcCheckboxColor : kcCardBackground,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCompleted ? kcCheckboxColor : kcSurfaceColor,
                  width: 1,
                ),
              ),
              child: isCompleted
                  ? const Icon(
                      Icons.check,
                      color: kcTextPrimary,
                      size: 20,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
