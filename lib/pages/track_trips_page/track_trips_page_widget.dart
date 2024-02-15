import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'track_trips_page_model.dart';
export 'track_trips_page_model.dart';

class TrackTripsPageWidget extends StatefulWidget {
  const TrackTripsPageWidget({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  @override
  State<TrackTripsPageWidget> createState() => _TrackTripsPageWidgetState();
}

class _TrackTripsPageWidgetState extends State<TrackTripsPageWidget> {
  late TrackTripsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackTripsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isLoading = true;
      });
      _model.apiResult51f = await StudentApisGroup.getAllTravileApiCall.call(
        token: FFAppState().userModel.token,
        lat: 31.989959,
        lng: 35.870176,
      );
      if ((_model.apiResult51f?.succeeded ?? true)) {
        setState(() {
          _model.localTravelsList = (getJsonField(
            (_model.apiResult51f?.jsonBody ?? ''),
            r'''$.travels''',
            true,
          )!
                  .toList()
                  .map<TravelModelStruct?>(TravelModelStruct.maybeFromMap)
                  .toList() as Iterable<TravelModelStruct?>)
              .withoutNulls
              .toList()
              .cast<TravelModelStruct>();
          if(_model.localTravelsList.isNotEmpty) {
            _model.isLoading = false;
          }
        });
      }
      _model.apiResultLastTrips =
          await StudentApisGroup.getLastTravileApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResultLastTrips?.succeeded ?? true)) {
        setState(() {
          _model.localTravelsLastTravelList = (getJsonField(
            (_model.apiResultLastTrips?.jsonBody ?? ''),
            r'''$.travels''',
            true,
          )!
                  .toList()
                  .map<TravelModelStruct?>(TravelModelStruct.maybeFromMap)
                  .toList() as Iterable<TravelModelStruct?>)
              .withoutNulls
              .toList()
              .cast<TravelModelStruct>();
          _model.localTravelsLastTravelList.removeWhere((element) => element.travel.travelStartName.isEmpty == true);
          _model.isLoading = false;
        });
      } else {
        setState(() {
          _model.isLoading = false;
        });
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
                  enText: 'Track Trips',
                  arText: 'تتبع الرحلات',
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                      visible: _model.localTravelsLastTravelList.isNotEmpty,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 75, left: 15, right: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'seld' /* seld */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Cairo',
                                    color: FlutterFlowTheme.of(context).black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: _model.localTravelsLastTravelList.isNotEmpty
                          ? const EdgeInsets.only(top: 10)
                          : const EdgeInsets.only(top: 70),
                      child: Builder(
                        builder: (context) {
                          final list2 =
                              _model.localTravelsLastTravelList.toList();
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: list2.length,
                            itemBuilder: (context, listIndex) {
                              final listItem2 = list2[listIndex];
                              return Visibility(
                                visible:_model.textController.text.isNotEmpty ?  listItem2.travel.travelStartName.contains(_model.textController.text) : true,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 10.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            15.0, 0.0, 15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Icon(
                                                              Icons.home_filled,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                              child: Text(
                                                                listItem2.travel
                                                                    .travelStartName,
                                                                style: FlutterFlowTheme
                                                                        .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              listItem2.travel.wayPoints
                                                                  .first.time,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: const Color(
                                                                        0xFF48CD48),
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                              child: Text(
                                                                listItem2.travel.way,
                                                                style: FlutterFlowTheme
                                                                        .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              listItem2.travel.wayPoints
                                                                  .last.time,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                              child: Text(
                                                                listItem2.travel
                                                                    .travelEndName,
                                                                style: FlutterFlowTheme
                                                                        .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .location_on_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      15.0,
                                                                      0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final locationPoints =
                                                                          listItem2.travel
                                                                              .wayPoints
                                                                              .toList();
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize
                                                                                .max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceEvenly,
                                                                        children: List.generate(
                                                                            locationPoints
                                                                                .length,
                                                                            (locationPointsIndex) {
                                                                          final locationPointsItem =
                                                                              locationPoints[locationPointsIndex];
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.location_on_outlined,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 18.0,
                                                                              ),
                                                                              Text(
                                                                                locationPointsItem.label,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Cairo',
                                                                                      color: FlutterFlowTheme.of(context).black,
                                                                                      fontSize: 10.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const StyledDivider(
                                                              height: 0.0,
                                                              thickness: 1.0,
                                                              indent: 20.0,
                                                              color: Color(
                                                                  0xFFA8A8A8),
                                                              lineStyle:
                                                                  DividerLineStyle
                                                                      .dashed,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(15.0, 20.0,
                                                            15.0, 0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context).getText(
                                                'flow' /* flow Line */,
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        FlutterFlowTheme.of(context)
                                                            .primary,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          onTap: (){
                                            context.pushNamed(
                                              'DetailsTrackingPage',
                                              queryParameters: {
                                                'travelModelStruct': serializeParam(
                                                  listItem2.toMap(),
                                                  ParamType.JSON,
                                                ),
                                                'isTripSelected': serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      endIndent: 18,
                                      indent: 18,
                                      thickness: 1.0,
                                      color: Color(0xFFA8A8A8),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: _model.localTravelsLastTravelList.isNotEmpty && _model.localTravelsList.isNotEmpty,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 25, left: 15, right: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'nereYou' /* nereYou */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Cairo',
                                    color: Color(0xFFA8A8A8),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: _model.localTravelsLastTravelList.isNotEmpty
                          ? const EdgeInsets.only(top: 10)
                          : const EdgeInsets.only(top: 10),
                      child: Builder(
                        builder: (context) {
                          final list = _model.localTravelsList.toList();
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: list.length,
                            itemBuilder: (context, listIndex) {
                              final listItem = list[listIndex];
                              return Visibility(
                                visible:_model.textController.text.isNotEmpty ?  listItem.travelStartName.contains(_model.textController.text) : true,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 10.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            15.0, 0.0, 15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Icon(
                                                              Icons.home_filled,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                              child: Text(
                                                                listItem
                                                                    .travelStartName,
                                                                style: FlutterFlowTheme
                                                                        .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              listItem.wayPoints
                                                                  .first.time,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: const Color(
                                                                        0xFF48CD48),
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                              child: Text(
                                                                listItem.way,
                                                                style: FlutterFlowTheme
                                                                        .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              listItem.wayPoints
                                                                  .last.time,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    fontSize:
                                                                        10.0,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                              child: Text(
                                                                listItem
                                                                    .travelEndName,
                                                                style: FlutterFlowTheme
                                                                        .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .location_on_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      15.0,
                                                                      0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final locationPoints =
                                                                          listItem
                                                                              .wayPoints
                                                                              .toList();
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize
                                                                                .max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceEvenly,
                                                                        children: List.generate(
                                                                            locationPoints
                                                                                .length,
                                                                            (locationPointsIndex) {
                                                                          final locationPointsItem =
                                                                              locationPoints[locationPointsIndex];
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.location_on_outlined,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 18.0,
                                                                              ),
                                                                              Text(
                                                                                locationPointsItem.label,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Cairo',
                                                                                      color: FlutterFlowTheme.of(context).black,
                                                                                      fontSize: 10.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const StyledDivider(
                                                              height: 0.0,
                                                              thickness: 1.0,
                                                              indent: 20.0,
                                                              color: Color(
                                                                  0xFFA8A8A8),
                                                              lineStyle:
                                                                  DividerLineStyle
                                                                      .dashed,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 15.0,
                                                            15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        ClipRRect(
                                                          child: SvgPicture.asset(
                                                            'assets/images/Group_26.svg',
                                                            width: 30.0,
                                                            height: 20.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            Builder(
                                                              builder: (context) {
                                                                final listOf =
                                                                    listItem
                                                                        .wayPoints
                                                                        .toList();
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      listOf.length >
                                                                              3
                                                                          ? 3
                                                                          : listOf
                                                                              .length,
                                                                      (listOfIndex) {
                                                                    final listOfItem =
                                                                        listOf[
                                                                            listOfIndex];
                                                                    return Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(2.0),
                                                                            bottomRight:
                                                                                Radius.circular(2.0),
                                                                            topLeft:
                                                                                Radius.circular(2.0),
                                                                            topRight:
                                                                                Radius.circular(2.0),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              3.0,
                                                                              3.0,
                                                                              3.0,
                                                                              3.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'p0zzvg9x' /* 022/25 */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                            Visibility(
                                                                visible: listItem
                                                                    .isMoreClicked,
                                                                child: Container(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 190,
                                                                  child: GridView
                                                                      .builder(
                                                                    physics:
                                                                        const NeverScrollableScrollPhysics(),
                                                                    gridDelegate:
                                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisCount:
                                                                          3,
                                                                      mainAxisSpacing:
                                                                          1,
                                                                      crossAxisSpacing:
                                                                          0.1,
                                                                      childAspectRatio:
                                                                          2.7, // Aspect ratio of each item
                                                                    ),
                                                                    shrinkWrap: true,
                                                                    itemCount: listItem
                                                                        .wayPoints
                                                                        .length,
                                                                    itemBuilder:
                                                                        (BuildContext
                                                                                context,
                                                                            int index) {
                                                                      final listOfItem =
                                                                          listItem
                                                                              .wayPoints[index];
                                                                      return Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            borderRadius: const BorderRadius
                                                                                .all(
                                                                                Radius.circular(2.0)),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsets
                                                                                .all(
                                                                                3.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize:
                                                                                  MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText('p0zzvg9x' /* 022/25 */),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                )),
                                                          ],
                                                        ),
                                                        Visibility(
                                                          visible: listItem
                                                                  .wayPoints
                                                                  .toList()
                                                                  .length >
                                                              3,
                                                          child: InkWell(
                                                            onTap: () {
                                                              if (listItem
                                                                  .isMoreClicked) {
                                                                setState(() {
                                                                  list
                                                                      .map((e) =>
                                                                          e.isMoreClicked =
                                                                              false)
                                                                      .toList();

                                                                  list
                                                                      .map((e) => e.id ==
                                                                              listItem
                                                                                  .id
                                                                          ? e.isMoreClicked =
                                                                              false
                                                                          : e.isMoreClicked =
                                                                              true)
                                                                      .toList();
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  list
                                                                      .map((e) =>
                                                                          e.isMoreClicked =
                                                                              false)
                                                                      .toList();

                                                                  list
                                                                      .map((e) => e.id ==
                                                                              listItem
                                                                                  .id
                                                                          ? e.isMoreClicked =
                                                                              true
                                                                          : e.isMoreClicked =
                                                                              false)
                                                                      .toList();
                                                                });
                                                              }
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primary,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          2.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          2.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          2.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          2.0),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        3.0,
                                                                        3.0,
                                                                        3.0,
                                                                        3.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      listItem
                                                                              .isMoreClicked
                                                                          ? FFLocalizations.of(context)
                                                                              .getText(
                                                                              'less' /* More */,
                                                                            )
                                                                          : FFLocalizations.of(context)
                                                                              .getText(
                                                                              'aqchkde4' /* More */,
                                                                            ),
                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color: FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
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
                                        InkWell(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context).getText(
                                                '4eklp4ju' /* Select Line */,
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        FlutterFlowTheme.of(context)
                                                            .primary,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          onTap: (){
                                            context.pushNamed(
                                              'DetailsTrackingPage',
                                              queryParameters: {
                                                'travelModelStruct': serializeParam(
                                                  listItem.toMap(),
                                                  ParamType.JSON,
                                                ),
                                                'isTripSelected': serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      endIndent: 18,
                                      indent: 18,
                                      thickness: 1.0,
                                      color: Color(0xFFA8A8A8),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
              Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'biniyc1q' /* Search */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      prefixIcon: const Icon(
                        Icons.search_outlined,
                      ),
                    ),
                    onChanged: (value){
                      setState(() {

                      });
                    },
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                        _model.textControllerValidator.asValidator(context),
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
