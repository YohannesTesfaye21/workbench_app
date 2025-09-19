import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workbench_app/ui/common/app_colors.dart';
import 'package:workbench_app/ui/common/app_strings.dart';
import 'package:workbench_app/ui/common/ui_helpers.dart';
import 'exercise_detail_viewmodel.dart';

class ExerciseDetailView extends StackedView<ExerciseDetailViewModel> {
  final String exerciseId;
  
  const ExerciseDetailView({
    Key? key,
    required this.exerciseId,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, ExerciseDetailViewModel viewModel, Widget? child) {
    if (viewModel.isBusy) {
      return Scaffold(
        backgroundColor: kcBackgroundColor,
        body: const Center(
          child: CircularProgressIndicator(color: kcPrimaryColor),
        ),
      );
    }

    if (viewModel.exercise == null) {
      return Scaffold(
        backgroundColor: kcBackgroundColor,
        appBar: AppBar(
          backgroundColor: kcBackgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: viewModel.goBack,
            icon: const Icon(Icons.arrow_back_ios, color: kcTextPrimary),
          ),
          title: const Text(
            ksExercise,
            style: TextStyle(
              color: kcTextPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: kcTextSecondary,
              ),
              verticalSpaceMedium,
              Text(
                ksErrorLoadingExercise,
                style: TextStyle(
                  fontSize: getMobileSubtitleSize(context),
                  color: kcTextSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, viewModel),
          _buildExerciseHeader(context, viewModel),
          _buildExerciseImage(context, viewModel),
          _buildExerciseInfo(context, viewModel),
          _buildInstructions(context, viewModel),
          _buildTips(context, viewModel),
          _buildWarnings(context, viewModel),
          _buildVariations(context, viewModel),
          _buildProgressions(context, viewModel),
          _buildMetrics(context, viewModel),
          _buildBottomPadding(),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, ExerciseDetailViewModel viewModel) {
    return SliverAppBar(
      expandedHeight: 0,
      floating: true,
      pinned: true,
      backgroundColor: kcBackgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: viewModel.goBack,
        icon: const Icon(Icons.arrow_back_ios, color: kcTextPrimary),
      ),
      title: Text(
        viewModel.exercise?.name ?? ksExercise,
        style: TextStyle(
          color: kcTextPrimary,
          fontSize: getMobileSubtitleSize(context),
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => viewModel.toggleFavorite(),
          icon: Icon(
            viewModel.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: viewModel.isFavorite ? kcErrorColor : kcTextSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseHeader(BuildContext context, ExerciseDetailViewModel viewModel) {
    final exercise = viewModel.exercise!;
    
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(getMobilePadding(context)),
        padding: EdgeInsets.all(getMobileCardPadding(context)),
        decoration: BoxDecoration(
          color: kcCardBackground,
          borderRadius: BorderRadius.circular(getMobileCardRadius(context)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.name,
              style: TextStyle(
                fontSize: getMobileTitleSize(context),
                fontWeight: FontWeight.bold,
                color: kcTextPrimary,
              ),
            ),
            verticalSpaceSmall,
            Text(
              exercise.description,
              style: TextStyle(
                fontSize: getMobileBodySize(context),
                color: kcTextSecondary,
                height: 1.5,
              ),
            ),
            verticalSpaceMedium,
            Row(
              children: [
                _buildInfoChip(
                  context,
                  exercise.difficulty.toUpperCase(),
                  _getDifficultyColor(exercise.difficulty),
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  context,
                  exercise.equipment.toUpperCase(),
                  kcInfoColor,
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  context,
                  exercise.muscleGroup.toUpperCase(),
                  kcPrimaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseImage(BuildContext context, ExerciseDetailViewModel viewModel) {
    final exercise = viewModel.exercise!;
    
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getMobilePadding(context)),
        height: getExerciseImageHeight(context),
        decoration: BoxDecoration(
          color: kcSurfaceColor,
          borderRadius: BorderRadius.circular(getMobileCardRadius(context)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getExerciseIcon(exercise.name),
                size: 80,
                color: kcTextSecondary,
              ),
              verticalSpaceSmall,
              Text(
                'Exercise Image',
                style: TextStyle(
                  fontSize: getMobileBodySize(context),
                  color: kcTextSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseInfo(BuildContext context, ExerciseDetailViewModel viewModel) {
    final exercise = viewModel.exercise!;
    
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(getMobilePadding(context)),
        padding: EdgeInsets.all(getMobileCardPadding(context)),
        decoration: BoxDecoration(
          color: kcCardBackground,
          borderRadius: BorderRadius.circular(getMobileCardRadius(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercise Information',
              style: TextStyle(
                fontSize: getMobileSubtitleSize(context),
                fontWeight: FontWeight.bold,
                color: kcTextPrimary,
              ),
            ),
            verticalSpaceMedium,
            _buildInfoRow(context, 'Duration', '${exercise.estimatedDuration ~/ 60} ${ksMinutes}'),
            _buildInfoRow(context, 'Rest Time', '${exercise.restTime} ${ksSeconds}'),
            _buildInfoRow(context, 'Equipment Required', exercise.requiresEquipment ? 'Yes' : 'No'),
            _buildInfoRow(context, 'Bodyweight', exercise.isBodyweight ? 'Yes' : 'No'),
            if (exercise.primaryMuscles.isNotEmpty)
              _buildMuscleGroupRow(context, 'Primary Muscles', exercise.primaryMuscles),
            if (exercise.secondaryMuscles.isNotEmpty)
              _buildMuscleGroupRow(context, 'Secondary Muscles', exercise.secondaryMuscles),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructions(BuildContext context, ExerciseDetailViewModel viewModel) {
    final exercise = viewModel.exercise!;
    
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(getMobilePadding(context)),
        padding: EdgeInsets.all(getMobileCardPadding(context)),
        decoration: BoxDecoration(
          color: kcCardBackground,
          borderRadius: BorderRadius.circular(getMobileCardRadius(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ksInstructions,
              style: TextStyle(
                fontSize: getMobileSubtitleSize(context),
                fontWeight: FontWeight.bold,
                color: kcTextPrimary,
              ),
            ),
            verticalSpaceMedium,
            ...exercise.instructions.asMap().entries.map((entry) {
              final index = entry.key;
              final instruction = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: kcPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        instruction,
                        style: TextStyle(
                          fontSize: getMobileBodySize(context),
                          color: kcTextPrimary,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTips(BuildContext context, ExerciseDetailViewModel viewModel) {
    final exercise = viewModel.exercise!;
    
    if (exercise.tips.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
    
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(getMobilePadding(context)),
        padding: EdgeInsets.all(getMobileCardPadding(context)),
        decoration: BoxDecoration(
          color: kcCardBackground,
          borderRadius: BorderRadius.circular(getMobileCardRadius(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.lightbulb_outline, color: kcPrimaryColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Tips',
                  style: TextStyle(
                    fontSize: getMobileSubtitleSize(context),
                    fontWeight: FontWeight.bold,
                    color: kcTextPrimary,
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            ...exercise.tips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle_outline, color: kcSuccessColor, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      tip,
                      style: TextStyle(
                        fontSize: getMobileBodySize(context),
                        color: kcTextPrimary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildWarnings(BuildContext context, ExerciseDetailViewModel viewModel) {
    final exercise = viewModel.exercise!;
    
    if (exercise.warnings.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
    
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(getMobilePadding(context)),
        padding: EdgeInsets.all(getMobileCardPadding(context)),
        decoration: BoxDecoration(
          color: kcErrorColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(getMobileCardRadius(context)),
          border: Border.all(color: kcErrorColor.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.warning_outlined, color: kcErrorColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Warnings',
                  style: TextStyle(
                    fontSize: getMobileSubtitleSize(context),
                    fontWeight: FontWeight.bold,
                    color: kcErrorColor,
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            ...exercise.warnings.map((warning) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.error_outline, color: kcErrorColor, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      warning,
                      style: TextStyle(
                        fontSize: getMobileBodySize(context),
                        color: kcTextPrimary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildVariations(BuildContext context, ExerciseDetailViewModel viewModel) {
    final exercise = viewModel.exercise!;
    
    if (exercise.variations.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
    
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(getMobilePadding(context)),
        padding: EdgeInsets.all(getMobileCardPadding(context)),
        decoration: BoxDecoration(
          color: kcCardBackground,
          borderRadius: BorderRadius.circular(getMobileCardRadius(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Variations',
              style: TextStyle(
                fontSize: getMobileSubtitleSize(context),
                fontWeight: FontWeight.bold,
                color: kcTextPrimary,
              ),
            ),
            verticalSpaceMedium,
            ...exercise.variations.map((variation) => _buildVariationCard(context, variation)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressions(BuildContext context, ExerciseDetailViewModel viewModel) {
    final exercise = viewModel.exercise!;
    
    if (exercise.progressions.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
    
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(getMobilePadding(context)),
        padding: EdgeInsets.all(getMobileCardPadding(context)),
        decoration: BoxDecoration(
          color: kcCardBackground,
          borderRadius: BorderRadius.circular(getMobileCardRadius(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Progressions',
              style: TextStyle(
                fontSize: getMobileSubtitleSize(context),
                fontWeight: FontWeight.bold,
                color: kcTextPrimary,
              ),
            ),
            verticalSpaceMedium,
            ...exercise.progressions.map((progression) => _buildProgressionCard(context, progression)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMetrics(BuildContext context, ExerciseDetailViewModel viewModel) {
    final exercise = viewModel.exercise!;
    final metrics = exercise.metrics;
    
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(getMobilePadding(context)),
        padding: EdgeInsets.all(getMobileCardPadding(context)),
        decoration: BoxDecoration(
          color: kcCardBackground,
          borderRadius: BorderRadius.circular(getMobileCardRadius(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercise Metrics',
              style: TextStyle(
                fontSize: getMobileSubtitleSize(context),
                fontWeight: FontWeight.bold,
                color: kcTextPrimary,
              ),
            ),
            verticalSpaceMedium,
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    context,
                    'Calories/min',
                    '${metrics.caloriesPerMinute.toStringAsFixed(1)}',
                    Icons.local_fire_department,
                    kcErrorColor,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildMetricCard(
                    context,
                    'Difficulty',
                    '${metrics.difficultyRating.toStringAsFixed(1)}/10',
                    Icons.speed,
                    kcWarningColor,
                  ),
                ),
              ],
            ),
            verticalSpaceSmall,
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    context,
                    'Effectiveness',
                    '${metrics.effectivenessRating.toStringAsFixed(1)}/10',
                    Icons.star,
                    kcPrimaryColor,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildMetricCard(
                    context,
                    'MET Value',
                    '${metrics.metValue.toStringAsFixed(1)}',
                    Icons.fitness_center,
                    kcInfoColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomPadding() {
    return const SliverToBoxAdapter(
      child: SizedBox(height: 100),
    );
  }

  Widget _buildInfoChip(BuildContext context, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: getMobileCaptionSize(context),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: getMobileBodySize(context),
              color: kcTextSecondary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: getMobileBodySize(context),
              color: kcTextPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMuscleGroupRow(BuildContext context, String label, List<String> muscles) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: getMobileBodySize(context),
              color: kcTextSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: muscles.map((muscle) => _buildInfoChip(
              context,
              muscle.replaceAll('_', ' ').toUpperCase(),
              kcPrimaryColor,
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildVariationCard(BuildContext context, dynamic variation) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kcSurfaceColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            variation.name,
            style: TextStyle(
              fontSize: getMobileBodySize(context),
              fontWeight: FontWeight.bold,
              color: kcTextPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            variation.description,
            style: TextStyle(
              fontSize: getMobileCaptionSize(context),
              color: kcTextSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressionCard(BuildContext context, dynamic progression) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kcSurfaceColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            progression.name,
            style: TextStyle(
              fontSize: getMobileBodySize(context),
              fontWeight: FontWeight.bold,
              color: kcTextPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            progression.description,
            style: TextStyle(
              fontSize: getMobileCaptionSize(context),
              color: kcTextSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(BuildContext context, String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: getMobileBodySize(context),
              fontWeight: FontWeight.bold,
              color: kcTextPrimary,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: getMobileCaptionSize(context),
              color: kcTextSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return kcSuccessColor;
      case 'intermediate':
        return kcWarningColor;
      case 'advanced':
        return kcErrorColor;
      default:
        return kcTextSecondary;
    }
  }

  IconData _getExerciseIcon(String exerciseName) {
    if (exerciseName.toLowerCase().contains('squat')) return Icons.fitness_center;
    if (exerciseName.toLowerCase().contains('press')) return Icons.fitness_center;
    if (exerciseName.toLowerCase().contains('pull')) return Icons.fitness_center;
    if (exerciseName.toLowerCase().contains('row')) return Icons.fitness_center;
    return Icons.fitness_center;
  }

  @override
  ExerciseDetailViewModel viewModelBuilder(BuildContext context) => ExerciseDetailViewModel(exerciseId);
}
