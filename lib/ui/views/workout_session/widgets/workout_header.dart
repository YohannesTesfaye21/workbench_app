import 'package:flutter/material.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/ui_helpers.dart';
import '../../../common/app_colors.dart';
import '../workout_session_viewmodel.dart';

class WorkoutHeader extends StatelessWidget {
  final WorkoutSessionViewModel viewModel;

  const WorkoutHeader({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getMobilePadding(context),
        vertical: 8,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => viewModel.goBack(),
            icon: const Icon(Icons.arrow_back_ios, color: kcTextPrimary),
          ),
          Expanded(
            child: Text(
              "Chris' Full Body 1",
              style: AppTextStyles.textXlSemibold.copyWith(
                color: kcTextPrimary,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: kcTextPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.access_time, color: Colors.white, size: 16),
                const SizedBox(width: 4),
                Text(
                  viewModel.formattedDuration,
                  style: AppTextStyles.textSmSemibold.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
