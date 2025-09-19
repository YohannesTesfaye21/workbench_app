import 'package:flutter/material.dart';
import '../../../common/app_text_styles.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_strings.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            context,
            icon: Icons.description,
            label: ksInstructions,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: _buildActionButton(
            context,
            icon: Icons.directions_run,
            label: ksWarmUp,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: _buildActionButton(
            context,
            icon: Icons.help_outline,
            label: ksFAQ,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kcTextSecondary, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: kcTextSecondary, size: 14),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.textXsSemibold.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: kcTextPrimary,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
