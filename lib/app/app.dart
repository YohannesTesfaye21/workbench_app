import 'package:workbench_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:workbench_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:workbench_app/ui/views/workout_list/workout_list_view.dart';
import 'package:workbench_app/ui/views/workout_session/workout_session_view.dart';
import 'package:workbench_app/ui/views/workout_session/workout_session_viewmodel.dart';
import 'package:workbench_app/ui/views/exercise_detail/exercise_detail_view.dart';
import 'package:workbench_app/services/workout_service.dart';
import 'package:workbench_app/services/exercise_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: WorkoutListView),
    MaterialRoute(page: WorkoutSessionView),
    MaterialRoute(page: ExerciseDetailView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: WorkoutService),
    LazySingleton(classType: ExerciseService),
    LazySingleton(classType: WorkoutSessionViewModel),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
