import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../common/app_colors.dart';
import '../../common/app_strings.dart';
import 'workout_session_viewmodel.dart';
import 'widgets/workout_header.dart';
import 'widgets/exercise_carousel.dart';
import 'widgets/exercise_details_panel.dart';
import 'widgets/edit_mode_actions.dart';

class WorkoutSessionView extends StatefulWidget {
  const WorkoutSessionView({Key? key}) : super(key: key);

  @override
  State<WorkoutSessionView> createState() => _WorkoutSessionViewState();
}

class _WorkoutSessionViewState extends State<WorkoutSessionView> {
  late WorkoutSessionViewModel _viewModel;
  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    _viewModel = locator<WorkoutSessionViewModel>();
    _viewModel.onViewModelReady();
  }

  void _enterEditMode() {
    // Save the current state as original before entering edit mode
    _viewModel.setOriginalExercises();
    setState(() {
      _isEditMode = true;
    });
  }

  void _exitEditMode() {
    setState(() {
      _isEditMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkoutSessionViewModel>.reactive(
      viewModelBuilder: () => _viewModel,
      builder: (context, viewModel, child) {
        if (viewModel.isBusy) {
          return _buildLoadingState();
        }

        if (viewModel.exercises.isEmpty) {
          return _buildEmptyState(viewModel);
        }

        return _buildMainContent(context, viewModel);
      },
    );
  }

  Widget _buildLoadingState() {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: kcPrimaryColor),
            const SizedBox(height: 16),
            Text(
              ksLoading,
              style: const TextStyle(
                color: kcTextSecondary,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(WorkoutSessionViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.fitness_center,
              size: 64,
              color: kcTextSecondary,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => viewModel.onViewModelReady(),
              child: const CircularProgressIndicator(color: kcPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context, WorkoutSessionViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            WorkoutHeader(viewModel: viewModel),
            ExerciseCarousel(
              viewModel: viewModel,
              isEditMode: _isEditMode,
              onEnterEditMode: _enterEditMode,
            ),
            Expanded(
              child: ExerciseDetailsPanel(
                viewModel: viewModel,
                isEditMode: _isEditMode,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _isEditMode 
          ? EditModeActions(
              viewModel: viewModel,
              onExitEditMode: _exitEditMode,
            )
          : null,
    );
  }
}