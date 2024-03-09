import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'notification_page_model.dart';
export 'notification_page_model.dart';
import '/flutter_flow/custom_functions.dart' as functions;

class NotificationPageWidget extends StatefulWidget {
  const NotificationPageWidget({super.key});

  @override
  State<NotificationPageWidget> createState() => _NotificationPageWidgetState();
}

class _NotificationPageWidgetState extends State<NotificationPageWidget> {
  late NotificationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationPageModel());

    // On page load action.
    _model.isLoading = true;
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultgu1 = await StudentApisGroup.newsMobileApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResultgu1?.succeeded ?? true)) {
        _model.isLoading = false;
        setState(() {
          _model.listOfNots = (getJsonField(
            (_model.apiResultgu1?.jsonBody ?? ''),
            r'''$.news''',
            true,
          )!
                  .toList()
                  .map<NewsModelStruct?>(NewsModelStruct.maybeFromMap)
                  .toList() as Iterable<NewsModelStruct?>)
              .withoutNulls
              .toList()
              .cast<NewsModelStruct>();
        });
      }else{
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
                  (_model.apiResultgu1?.bodyText ??
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
        _model.isLoading = false;
      }
    });
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
                rightIcon: Container(),
                isRightHedding: false,
                isLeftHedding: false,
                title: FFLocalizations.of(context).getVariableText(
                  enText: 'Notification',
                  arText: 'الاشعارات',
                ),
                rightButtonAction: () async {
                  // context.pushNamed('NotificationPage');
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
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final listLo = _model.listOfNots.map((e) => e).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listLo.length,
                            itemBuilder: (context, listLoIndex) {
                              final listLoItem = listLo[listLoIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'NotificationDetailsPage',
                                      queryParameters: {
                                        'notiDynamic': serializeParam(
                                          listLoItem.toMap(),
                                          ParamType.JSON,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listLoItem.date,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Cairo',
                                              color: const Color(0xFFA8A8A8),
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  listLoItem.title,
                                                  maxLines: 3,
                                                  style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.normal,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          listLoItem.time,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Cairo',
                                                color: const Color(0xFFA8A8A8),
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1.0,
                                        color: Color(0xFFE4E4E4),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: _model.isLoading ?? false,
                child: const Center(
                  child: SizedBox(
                    width: 23,
                    height: 23,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blueAccent,
                      ),
                    ),
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
