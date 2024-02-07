import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'track_trips_page_widget.dart' show TrackTripsPageWidget;
import 'package:flutter/material.dart';

class TrackTripsPageModel extends FlutterFlowModel<TrackTripsPageWidget> {
  ///  Local state fields for this page.

  List<TravelModelStruct> localTravelsList = [];
  void addToLocalTravelsList(TravelModelStruct item) =>
      localTravelsList.add(item);
  void removeFromLocalTravelsList(TravelModelStruct item) =>
      localTravelsList.remove(item);
  void removeAtIndexFromLocalTravelsList(int index) =>
      localTravelsList.removeAt(index);
  void insertAtIndexInLocalTravelsList(int index, TravelModelStruct item) =>
      localTravelsList.insert(index, item);
  void updateLocalTravelsListAtIndex(
          int index, Function(TravelModelStruct) updateFn) =>
      localTravelsList[index] = updateFn(localTravelsList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetAllTravileApi)] action in TrackTripsPage widget.
  ApiCallResponse? apiResult51f;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for AppBar component.
  late AppBarModel appBarModel;

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
