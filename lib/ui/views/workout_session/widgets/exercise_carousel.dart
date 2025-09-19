import 'package:flutter/material.dart';
import '../../../common/ui_helpers.dart';
import '../workout_session_viewmodel.dart';
import 'exercise_item.dart';
import 'edit_button.dart';
import 'add_button.dart';

class ExerciseCarousel extends StatelessWidget {
  final WorkoutSessionViewModel viewModel;
  final bool isEditMode;
  final VoidCallback onEnterEditMode;

  const ExerciseCarousel({
    Key? key,
    required this.viewModel,
    required this.isEditMode,
    required this.onEnterEditMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: isEditMode
          ? _buildEditableExerciseList(context)
          : _buildExerciseList(context),
    );
  }

  Widget _buildExerciseList(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: getMobilePadding(context)),
      itemCount: viewModel.exercises.length + 1, // +1 for edit button
      itemBuilder: (context, index) {
        if (index == viewModel.exercises.length) {
          return EditButton(
            viewModel: viewModel,
            onEnterEditMode: onEnterEditMode,
          );
        }
        
        final exercise = viewModel.exercises[index];
        final isCurrent = index == viewModel.currentExerciseIndex;
        final isCompleted = exercise.isCompleted;
        
        return ExerciseItem(
          exercise: exercise,
          index: index,
          isCurrent: isCurrent,
          isCompleted: isCompleted,
          viewModel: viewModel,
          onEnterEditMode: onEnterEditMode,
        );
      },
    );
  }

  Widget _buildEditableExerciseList(BuildContext context) {
    return ReorderableListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: getMobilePadding(context)),
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) {
          newIndex--;
        }
        viewModel.reorderExercises(oldIndex, newIndex);
      },
      children: [
        ...viewModel.exercises.asMap().entries.map((entry) {
          final index = entry.key;
          final exercise = entry.value;
          return EditableExerciseItem(
            key: ValueKey(exercise.id),
            exercise: exercise,
            index: index,
            viewModel: viewModel,
          );
        }).toList(),
        // Add button (not reorderable)
        AddButton(
          key: const ValueKey('add_button'),
          viewModel: viewModel,
        ),
      ],
    );
  }
}