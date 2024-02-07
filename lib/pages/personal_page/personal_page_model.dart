import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'personal_page_widget.dart' show PersonalPageWidget;
import 'package:flutter/material.dart';

class PersonalPageModel extends FlutterFlowModel<PersonalPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
