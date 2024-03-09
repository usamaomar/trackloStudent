import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_page_widget.dart' show NotificationPageWidget;
import 'package:flutter/material.dart';

class NotificationPageModel extends FlutterFlowModel<NotificationPageWidget> {
  ///  Local state fields for this page.

  List<NewsModelStruct> listOfNots = [];

  void addToListOfNots(NewsModelStruct item) => listOfNots.add(item);

  void removeFromListOfNots(NewsModelStruct item) => listOfNots.remove(item);

  void removeAtIndexFromListOfNots(int index) => listOfNots.removeAt(index);

  void insertAtIndexInListOfNots(int index, NewsModelStruct item) =>
      listOfNots.insert(index, item);

  void updateListOfNotsAtIndex(int index, Function(NewsModelStruct) updateFn) =>
      listOfNots[index] = updateFn(listOfNots[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  // Stores action output result for [Backend Call - API (NewsMobileApi)] action in NotificationPage widget.
  ApiCallResponse? apiResultgu1;

  // Model for AppBar component.
  late AppBarModel appBarModel;
  bool isLoading = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
