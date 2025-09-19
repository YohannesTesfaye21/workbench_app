import 'package:flutter/material.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_strings.dart';

class SetsHeader extends StatelessWidget {
  const SetsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: kcCardBackground,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '#',
              style: AppTextStyles.textSmSemibold.copyWith(
                color: kcTextSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              ksKilograms,
              style: AppTextStyles.textSmSemibold.copyWith(
                color: kcTextSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              ksReps,
              style: AppTextStyles.textSmSemibold.copyWith(
                color: kcTextSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ksTenRepMax,
                  style: AppTextStyles.textSmSemibold.copyWith(
                    color: kcTextSecondary,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.help_outline,
                  size: 14,
                  color: kcTextSecondary,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(width: 32), // Space for status icon
        ],
      ),
    );
  }
}
