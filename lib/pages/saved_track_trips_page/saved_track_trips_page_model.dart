import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'saved_track_trips_page_widget.dart' show SavedTrackTripsPageWidget;
import 'package:flutter/material.dart';

class SavedTrackTripsPageModel extends FlutterFlowModel<SavedTrackTripsPageWidget> {
  ///  Local state fields for this page.

  // List<TravelModelStruct> localTravelsList = [];
  // void addToLocalTravelsList(TravelModelStruct item) =>
  //     localTravelsList.add(item);
  // void removeFromLocalTravelsList(TravelModelStruct item) =>
  //     localTravelsList.remove(item);
  // void removeAtIndexFromLocalTravelsList(int index) =>
  //     localTravelsList.removeAt(index);
  // void insertAtIndexInLocalTravelsList(int index, TravelModelStruct item) =>
  //     localTravelsList.insert(index, item);
  // void updateLocalTravelsListAtIndex(
  //         int index, Function(TravelModelStruct) updateFn) =>
  //     localTravelsList[index] = updateFn(localTravelsList[index]);
  //


  List<TravelModelStruct> localTravelsLastTravelList = [];
  void addToLocalTravelsLastTravelList(TravelModelStruct item) =>
      localTravelsLastTravelList.add(item);
  void removeFromLocalTravelsLastTravelList(TravelModelStruct item) =>
      localTravelsLastTravelList.remove(item);
  void removeAtIndexFromLocalTravelsLastTravelList(int index) =>
      localTravelsLastTravelList.removeAt(index);
  void insertAtIndexInLocalTravelsLastTravelList(int index, TravelModelStruct item) =>
      localTravelsLastTravelList.insert(index, item);
  void updateLocalTravelsLastTravelListAtIndex(
      int index, Function(TravelModelStruct) updateFn) =>
      localTravelsLastTravelList[index] = updateFn(localTravelsLastTravelList[index]);


  bool? isLoading;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetAllTravileApi)] action in TrackTripsPage widget.
  // ApiCallResponse? apiResult51f;
  ApiCallResponse? apiResultLastTrips;
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
    isLoading = false;
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
