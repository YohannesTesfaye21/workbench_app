import 'package:flutter/material.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/app_colors.dart';
import '../workout_session_viewmodel.dart';

class AddButton extends StatelessWidget {
  final WorkoutSessionViewModel viewModel;

  const AddButton({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => viewModel.addExercise(),
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kcCardBackground,
                border: Border.all(color: kcPrimaryColor, width: 2),
              ),
              child: const Icon(
                Icons.add,
                color: kcPrimaryColor,
                size: 24,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Add',
            style: AppTextStyles.textXsMedium.copyWith(
              color: kcPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
