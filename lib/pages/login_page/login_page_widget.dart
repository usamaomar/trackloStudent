import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '13adi88g' /* Login */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).black,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController1,
                              focusNode: _model.textFieldFocusNode1,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'lc0ocz4a' /* Phone Number */,
                                ),
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.isPhoneValid == true
                                        ? FlutterFlowTheme.of(context).black
                                        : FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.isPhoneValid == true
                                        ? FlutterFlowTheme.of(context).black
                                        : FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.isPhoneValid == true
                                        ? FlutterFlowTheme.of(context).black
                                        : FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.isPhoneValid == true
                                        ? FlutterFlowTheme.of(context).black
                                        : FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              keyboardType: TextInputType.number,
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                          if (_model.isPhoneValid == false)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 7.0, 10.0, 5.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'igrr73ni' /* Phone Number Is Invalid */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      color: FlutterFlowTheme.of(context).error,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController2,
                              focusNode: _model.textFieldFocusNode2,
                              textInputAction: TextInputAction.done,
                              obscureText: !_model.passwordVisibility,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'ac2zq5ys' /* Password */,
                                ),
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.isPasswordValid == true
                                        ? FlutterFlowTheme.of(context).black
                                        : FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.isPasswordValid == true
                                        ? FlutterFlowTheme.of(context).black
                                        : FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.isPasswordValid == true
                                        ? FlutterFlowTheme.of(context).black
                                        : FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: _model.isPasswordValid == true
                                        ? FlutterFlowTheme.of(context).black
                                        : FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.passwordVisibility =
                                        !_model.passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: FlutterFlowTheme.of(context).black,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              keyboardType: TextInputType.visiblePassword,
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            ),
                          ),
                          if (_model.isPasswordValid == false)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 7.0, 10.0, 5.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'kr2gng6e' /* Password Is Invalid */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      color: FlutterFlowTheme.of(context).error,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.textController1.text != '') {
                                  setState(() {
                                    _model.isPhoneValid = true;
                                  });
                                } else {
                                  setState(() {
                                    _model.isPhoneValid = false;
                                  });
                                }

                                if (_model.textController2.text != '') {
                                  setState(() {
                                    _model.isPasswordValid = true;
                                  });
                                } else {
                                  setState(() {
                                    _model.isPasswordValid = false;
                                  });
                                }

                                if ((_model.isPhoneValid == true) &&
                                        (_model.isPasswordValid == true)
                                    ? true
                                    : false) {
                                  _model.apiResultanu =
                                      await StudentApisGroup.loginApiCall.call(
                                    password: _model.textController2.text,
                                    phone: functions.convertPhoneNumber(
                                        _model.textController1.text),
                                  );
                                  if ((_model.apiResultanu?.succeeded ??
                                      true)) {
                                    setState(() {
                                      FFAppState().userModel =
                                          UserModelStruct.maybeFromMap(
                                              getJsonField(
                                        (_model.apiResultanu?.jsonBody ?? ''),
                                        r'''$.data''',
                                      ))!;
                                    });

                                    context.goNamed('MapPage');
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            enText: 'Error',
                                            arText: 'خطأ',
                                          )),
                                          content: Text(functions.parseErrorMsg(
                                              (_model.apiResultanu?.bodyText ??
                                                  ''))),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText: 'Ok',
                                                arText: 'حسنا',
                                              )),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '81d8l2oc' /* Login */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF527ED2),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
