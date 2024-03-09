import '/backend/schema/structs/index.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'notification_details_page_model.dart';
export 'notification_details_page_model.dart';

class NotificationDetailsPageWidget extends StatefulWidget {
  const NotificationDetailsPageWidget({
    super.key,
    required this.notiDynamic,
  });

  final dynamic notiDynamic;

  @override
  State<NotificationDetailsPageWidget> createState() =>
      _NotificationDetailsPageWidgetState();
}

class _NotificationDetailsPageWidgetState
    extends State<NotificationDetailsPageWidget> {
  late NotificationDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationDetailsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.notiModel = NewsModelStruct.maybeFromMap(widget.notiDynamic);
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                rightIcon: const Icon(
                  Icons.onetwothree_outlined,
                ),
                isRightHedding: false,
                isLeftHedding: false,
                title: FFLocalizations.of(context).getVariableText(
                  enText: 'Notification',
                  arText: 'الاشعارات',
                ),
                rightButtonAction: () async {
                  context.pushNamed('NotificationDetailsPage');
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
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.network(
                  'https://picsum.photos/seed/342/600',
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _model.notiModel!.title,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Cairo',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    _model.notiModel!.description,
                                    maxLines: 3,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
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
                            _model.notiModel!.time,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
