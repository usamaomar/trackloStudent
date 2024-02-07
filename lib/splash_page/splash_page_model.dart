import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'splash_page_widget.dart' show SplashPageWidget;
import 'package:flutter/material.dart';

class SplashPageModel extends FlutterFlowModel<SplashPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  int timerMilliseconds = 3000;
  String timerValue = StopWatchTimer.getDisplayTime(
    3000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
