import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workbench_app/ui/common/app_colors.dart';
import 'package:workbench_app/ui/common/ui_helpers.dart';
import 'workout_list_viewmodel.dart';

class WorkoutListView extends StackedView<WorkoutListViewModel> {
  const WorkoutListView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, WorkoutListViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        backgroundColor: kcBackgroundColor,
        elevation: 0,
        title: const Text(
          'Workouts',
          style: TextStyle(
            color: kcTextPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: viewModel.createNewWorkout,
            icon: const Icon(Icons.add, color: kcTextPrimary),
          ),
        ],
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: viewModel.workouts.length,
              itemBuilder: (context, index) {
                final workout = viewModel.workouts[index];
                return _WorkoutCard(
                  workout: workout,
                  onTap: () => viewModel.startWorkout(workout.id),
                  onEdit: () => viewModel.editWorkout(workout.id),
                  onDelete: () => viewModel.deleteWorkout(workout.id),
                );
              },
            ),
    );
  }

  @override
  WorkoutListViewModel viewModelBuilder(BuildContext context) => WorkoutListViewModel();
}

class _WorkoutCard extends StatelessWidget {
  final dynamic workout;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _WorkoutCard({
    required this.workout,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      workout.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kcTextPrimary,
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == 'edit') onEdit();
                      if (value == 'delete') onDelete();
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpaceSmall,
              Text(
                workout.description,
                style: const TextStyle(
                  color: kcTextSecondary,
                  fontSize: 14,
                ),
              ),
              verticalSpaceSmall,
              Row(
                children: [
                  Icon(Icons.fitness_center, size: 16, color: kcTextSecondary),
                  horizontalSpaceTiny,
                  Text(
                    '${workout.exercises.length} exercises',
                    style: const TextStyle(
                      color: kcTextSecondary,
                      fontSize: 12,
                    ),
                  ),
                  horizontalSpaceMedium,
                  Icon(Icons.access_time, size: 16, color: kcTextSecondary),
                  horizontalSpaceTiny,
                  Text(
                    workout.estimatedDuration != null
                        ? '${workout.estimatedDuration!.inMinutes} min'
                        : 'No time set',
                    style: const TextStyle(
                      color: kcTextSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
