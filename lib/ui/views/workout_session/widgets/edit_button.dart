import 'package:flutter/material.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/app_colors.dart';
import '../workout_session_viewmodel.dart';

class EditButton extends StatelessWidget {
  final WorkoutSessionViewModel viewModel;
  final VoidCallback onEnterEditMode;

  const EditButton({
    Key? key,
    required this.viewModel,
    required this.onEnterEditMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onEnterEditMode,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kcCardBackground,
                border: Border.all(color: kcTextSecondary, width: 2),
              ),
              child: const Icon(
                Icons.edit,
                color: kcTextSecondary,
                size: 24,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Edit',
            style: AppTextStyles.textXsMedium.copyWith(
              color: kcTextSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
