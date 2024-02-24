import '/backend/api_requests/api_calls.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'personal_page_widget.dart' show PersonalPageWidget;
import 'package:flutter/material.dart';

class PersonalPageModel extends FlutterFlowModel<PersonalPageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? uploadedFile;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UploadImageApi)] action in Stack widget.
  ApiCallResponse? apiResulthhj;
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
    appBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
