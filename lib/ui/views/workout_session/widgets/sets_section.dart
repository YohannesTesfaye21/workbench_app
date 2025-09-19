import 'package:flutter/material.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_strings.dart';
import '../workout_session_viewmodel.dart';
import 'set_row.dart';
import 'sets_header.dart';

class SetsSection extends StatelessWidget {
  final WorkoutSessionViewModel viewModel;

  const SetsSection({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exercise = viewModel.currentExercise;
    if (exercise == null) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        color: kcCardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kcCardBackground,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with Sets title and Add Set button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: kcCardBackground,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ksSets,
                  style: AppTextStyles.textLgSemibold.copyWith(
                    color: kcTextPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: () => viewModel.addSetToExercise(viewModel.currentExerciseIndex),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add, color: Colors.black, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          ksAddSet,
                          style: AppTextStyles.textSmMedium.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Column headers
          SetsHeader(),
          Container(
            height: 1,
            color: kcCardBackground,
          ),
          // Set rows
          ...exercise.sets.asMap().entries.map((entry) {
            final index = entry.key;
            final set = entry.value;
            return Column(
              children: [
                if (index > 0)
                  Container(
                    height: 1,
                    color: kcCardBackground,
                  ),
                SetRow(
                  set: set,
                  index: index,
                  viewModel: viewModel,
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
