import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_phone_number_component_widget.dart'
    show UpdatePhoneNumberComponentWidget;
import 'package:flutter/material.dart';

class UpdatePhoneNumberComponentModel
    extends FlutterFlowModel<UpdatePhoneNumberComponentWidget> {
  ///  Local state fields for this component.

  bool newPhoneIsWrong = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (UpdateStudentFile)] action in Button widget.
  ApiCallResponse? apiResult6vm;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
