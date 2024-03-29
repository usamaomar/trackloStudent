import '/backend/api_requests/api_calls.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/action2_sheet_simple/action2_sheet_simple_widget.dart';
import '/pages/update_phone_number_component/update_phone_number_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'personal_page_model.dart';
export 'personal_page_model.dart';

class PersonalPageWidget extends StatefulWidget {
  const PersonalPageWidget({super.key});

  @override
  State<PersonalPageWidget> createState() => _PersonalPageWidgetState();
}

class _PersonalPageWidgetState extends State<PersonalPageWidget> {
  late PersonalPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(53.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: wrapWithModel(
              model: _model.appBarModel,
              updateCallback: () => setState(() {}),
              child: AppBarWidget(
                rightIcon: Icon(
                  Icons.notifications_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                isRightHedding: false,
                isLeftHedding: false,
                title: FFLocalizations.of(context).getVariableText(
                  enText: 'Profile',
                  arText: 'الملف الشخصي',
                ),
                rightButtonAction: () async {
                  context.pushNamed('NotificationPage');
                },
              ),
            ),
            actions: const [],
            centerTitle: false,
            toolbarHeight: 46.0,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 37.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final selectedFiles = await selectFiles(
                          multiFile: false,
                        );
                        if (selectedFiles != null) {
                          setState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          try {
                            selectedUploadedFiles = selectedFiles
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                    ))
                                .toList();
                          } finally {
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedFiles.length) {
                            setState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                            });
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        setState(() {
                          _model.uploadedFile = _model.uploadedLocalFile;
                        });
                        _model.apiResulthhj =
                            await StudentApisGroup.uploadImageApiCall.call(
                          token: FFAppState().userModel.token,
                          file: _model.uploadedFile,
                        );
                        if ((_model.apiResulthhj?.succeeded ?? true)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                FFLocalizations.of(context).getVariableText(
                                  enText: 'Data Is Updated',
                                  arText: 'تم تحديث البيانات',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          );
                        }

                        setState(() {});
                      },
                      child: Stack(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        children: [
                          Container(
                            width: 108.0,
                            height: 108.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              '',
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (_model.uploadedFile != null &&
                              (_model.uploadedFile?.bytes?.isNotEmpty ?? false))
                            Container(
                              width: 108.0,
                              height: 108.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          Container(
                            width: 109.0,
                            height: 109.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20.0,
                            buttonSize: 28.0,
                            fillColor: const Color(0xFF527ED2),
                            icon: Icon(
                              Icons.mode_edit_outline_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 15.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'bm1lwdff' /* Student Name */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Cairo',
                                ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFF527ED2),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 10.0, 15.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.person_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFAppState().userModel.name,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'xq8kmna6' /* University Number */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Cairo',
                                ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFF527ED2),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 10.0, 15.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.call_to_action_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFAppState().userModel.studentId,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'p7uex74q' /* Phone Number */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Cairo',
                                ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFFE4E4E4),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: const UpdatePhoneNumberComponentWidget(),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.phone_sharp,
                                      color: Color(0xFF527ED2),
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppState().userModel.phone,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Cairo',
                                              color: const Color(0xFF527ED2),
                                            ),
                                      ),
                                    ),
                                    const Flexible(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            color: Color(0xFF527ED2),
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 43.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: const Action2SheetSimpleWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: FFLocalizations.of(context).getText(
                                  '9vt5fluj' /* Change Password */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFFE4E4E4),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFFA8A8A8),
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
