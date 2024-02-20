import '../../backend/api_requests/api_manager.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'details_tracking_page_widget.dart' show DetailsTrackingPageWidget;
import 'package:flutter/material.dart';

class DetailsTrackingPageModel
    extends FlutterFlowModel<DetailsTrackingPageWidget> {
  ///  Local state fields for this page.

  TravelModelStruct? travelModelStruct;
  void updateTravelModelStructStruct(Function(TravelModelStruct) updateFn) =>
      updateFn(travelModelStruct ??= TravelModelStruct());
  ApiCallResponse? apiResult51f;

  ///  State fields for stateful widgets in this page.
  int counter = 0;
  final unfocusNode = FocusNode();
  bool isLoading = false;
  // State field(s) for Checkbox widget.

  Map<WayPointModelStruct, bool> checkboxValueMap = {};
  List<WayPointModelStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for AppBar component.
  late AppBarModel appBarModel;

  WayPointModelStruct? _wayPoint;
  WayPointModelStruct get wayPoint => _wayPoint ?? WayPointModelStruct();
  set wayPoint(WayPointModelStruct? val) => _wayPoint = val;
  void updateWayPoint(Function(WayPointModelStruct) updateFn) =>
      updateFn(_wayPoint ??= WayPointModelStruct());
  bool hasWayPoint() => _wayPoint != null;



  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    appBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
