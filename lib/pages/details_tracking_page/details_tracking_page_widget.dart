import '../../backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'details_tracking_page_model.dart';
export 'details_tracking_page_model.dart';

class DetailsTrackingPageWidget extends StatefulWidget {
  const DetailsTrackingPageWidget({
    super.key,
    required this.travelModelStruct,
    required this.latitude,
    required this.longitude,
    bool? isTripSelected,
    bool? isFromSide,
  })  : isTripSelected = isTripSelected ?? false,
        isFromSide = isFromSide ?? false;

  final dynamic travelModelStruct;
  final bool isTripSelected;
  final bool isFromSide;
  final double? latitude;
  final double? longitude;

  @override
  State<DetailsTrackingPageWidget> createState() =>
      _DetailsTrackingPageWidgetState();
}

class _DetailsTrackingPageWidgetState extends State<DetailsTrackingPageWidget> {
  late DetailsTrackingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsTrackingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.travelModelStruct =
            TravelModelStruct.maybeFromMap(widget.travelModelStruct);
      });
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
                  Icons.notifications,
                ),
                isRightHedding: false,
                isLeftHedding: false,
                title: FFLocalizations.of(context).getVariableText(
                  enText: 'Tracking Trip',
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(15.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Icon(
                                                  Icons.home_filled,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Text(
                                                    widget.isTripSelected
                                                        ? _model
                                                                .travelModelStruct
                                                                ?.travel
                                                                .travelStartName ??
                                                            ''
                                                        : _model.travelModelStruct
                                                                ?.travelStartName ??
                                                            '',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  widget.isTripSelected
                                                      ? _model
                                                              .travelModelStruct
                                                              ?.travel
                                                              .wayPoints
                                                              .first
                                                              .time ??
                                                          ''
                                                      : _model
                                                              .travelModelStruct
                                                              ?.wayPoints
                                                              .first
                                                              .time ??
                                                          '',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: const Color(
                                                            0xFF48CD48),
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      5.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                widget.isTripSelected
                                                    ? _model.travelModelStruct
                                                            ?.travel.way ??
                                                        ''
                                                    : _model.travelModelStruct
                                                            ?.way ??
                                                        '',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  widget.isTripSelected
                                                      ? _model
                                                              .travelModelStruct
                                                              ?.travel
                                                              .wayPoints
                                                              .last
                                                              .time ??
                                                          ''
                                                      : _model
                                                              .travelModelStruct
                                                              ?.wayPoints
                                                              .last
                                                              .time ??
                                                          '',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Cairo',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Text(
                                                    widget.isTripSelected
                                                        ? _model
                                                                .travelModelStruct
                                                                ?.travel
                                                                .travelEndName ??
                                                            ''
                                                        : _model.travelModelStruct
                                                                ?.travelEndName ??
                                                            '',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) {
                                                          final locationPoints =
                                                              widget.isTripSelected
                                                                  ? _model
                                                                      .travelModelStruct
                                                                      ?.travel
                                                                      .wayPoints
                                                                  : _model.travelModelStruct
                                                                          ?.wayPoints
                                                                          .toList() ??
                                                                      [];
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: List.generate(
                                                                locationPoints
                                                                        ?.length ??
                                                                    0,
                                                                (locationPointsIndex) {
                                                              final locationPointsItem =
                                                                  locationPoints?[
                                                                      locationPointsIndex];
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .location_on_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  Text(
                                                                    locationPointsItem
                                                                            ?.label ??
                                                                        '',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
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
                                                  color: Color(0xFFA8A8A8),
                                                  lineStyle:
                                                      DividerLineStyle.dashed,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        visible: !widget.isTripSelected,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            height: 50,
                                            child: Builder(
                                              builder: (context) {
                                                final list2 = _model
                                                    .travelModelStruct
                                                    ?.wayPoints
                                                    .toList();
                                                return ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: list2?.length,
                                                  itemBuilder:
                                                      (context, listIndex) {
                                                    final listItem2 =
                                                        list2?[listIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(5.0,
                                                              0.0, 5.0, 0.0),
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  5.0,
                                                                  5.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                listItem2
                                                                        ?.label ??
                                                                    '',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            10),
                                                              ),
                                                              Theme(
                                                                data: ThemeData(
                                                                  checkboxTheme:
                                                                      CheckboxThemeData(
                                                                    visualDensity:
                                                                        VisualDensity
                                                                            .compact,
                                                                    materialTapTargetSize:
                                                                        MaterialTapTargetSize
                                                                            .shrinkWrap,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  unselectedWidgetColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                ),
                                                                child: Checkbox(
                                                                  value: listItem2
                                                                          ?.isSelected ??
                                                                      false,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    setState(
                                                                        () {
                                                                      list2?.forEach(
                                                                          (element) {
                                                                        element.isSelected =
                                                                            false;
                                                                      });
                                                                      list2?.forEach(
                                                                          (element) {
                                                                        if (element.id ==
                                                                            listItem2?.id) {
                                                                          element.isSelected =
                                                                              newValue;
                                                                          if (newValue ==
                                                                              true) {
                                                                            _model.wayPoint =
                                                                                element;
                                                                          } else {
                                                                            _model.wayPoint =
                                                                                null;
                                                                          }
                                                                        }
                                                                      });
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  checkColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: !widget.isTripSelected,
                          child: const Divider(
                            thickness: 1.0,
                            color: Color(0xFFA8A8A8),
                          ),
                        ),
                        Visibility(
                          visible: !widget.isTripSelected,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 15.0, 25.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'f2yd6pz8' /* Bus tracking distance from the... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
                                              .black,
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !widget.isTripSelected,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: const Color(0xFF0BBC0B),
                                  borderRadius: 12.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: const Icon(
                                    Icons.add,
                                    color: Color(0xFF0BBC0B),
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _model.counter = _model.counter + 1;
                                      _model.textController.text =
                                          _model.counter.toString();
                                    });
                                  },
                                ),
                                Flexible(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        if (value == '-') {
                                          setState(() {
                                            _model.counter = 0;
                                            _model.textController.text = '';
                                          });
                                        } else if (int.tryParse(value)! <= 0) {
                                          setState(() {
                                            _model.textController.text = '';
                                          });
                                        } else {
                                          _model.counter = int.parse(value);
                                        }
                                      },
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.number,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).error,
                                  borderRadius: 12.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.minimize_outlined,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    if (_model.counter > 0) {
                                      setState(() {
                                        _model.counter = _model.counter - 1;
                                        _model.textController.text =
                                            _model.counter.toString();
                                      });
                                    }
                                  },
                                ),
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF527ED2),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(7.0),
                                            bottomRight: Radius.circular(7.0),
                                            topLeft: Radius.circular(7.0),
                                            topRight: Radius.circular(7.0),
                                          ),
                                          border: Border.all(
                                            color: const Color(0xFF90BAE2),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15.0, 15.0, 15.0, 15.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'rit21eza' /* KM */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                              ),
                                            ],
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
                        Visibility(
                          visible: widget.isTripSelected,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 15.0, 25.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'k9q4znl3' /* Breakpoint */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
                                              .black,
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: widget.isTripSelected,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 25.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 8.0,
                                  height: 8.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF527ED2),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Text(
                                    _model.travelModelStruct?.wayPoint.label ??
                                        '',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFF527ED2),
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: widget.isTripSelected,
                          child: const Divider(
                            thickness: 0.5,
                            indent: 15.0,
                            endIndent: 15.0,
                            color: Color(0xFFA8A8A8),
                          ),
                        ),
                        Visibility(
                          visible: widget.isTripSelected,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'jufmqx2g' /* Bus tracking distance from the... */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF527ED2),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(7.0),
                                          bottomRight: Radius.circular(7.0),
                                          topLeft: Radius.circular(7.0),
                                          topRight: Radius.circular(7.0),
                                        ),
                                        border: Border.all(
                                          color: const Color(0xFF90BAE2),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(5.0, 5.0, 5.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${_model.travelModelStruct?.range} ${FFLocalizations.of(context).getText(
                                                'jjrem21y' /* KM */,
                                              )}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF527ED2),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(7.0),
                                      bottomRight: Radius.circular(7.0),
                                      topLeft: Radius.circular(7.0),
                                      topRight: Radius.circular(7.0),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFF90BAE2),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 15.0, 15.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'vxl7mb76' /* Start Trip */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  if (widget.isTripSelected) {
                                    setState(() {
                                      _model.isLoading = true;
                                    });
                                    _model.apiResult51f = await StudentApisGroup
                                        .startTrackingBusesCall
                                        .call(
                                      token: FFAppState().userModel.token,
                                      // currentLat: widget.latitude,// 31.988936
                                      currentLat:  31.988936,
                                      // currentLng: widget.longitude,// 35.8642732
                                      currentLng:   35.8642732,
                                      // range: int.tryParse(
                                      //     (_model.travelModelStruct?.range ??
                                      //         '0')),
                                      range: 10,
                                      // lat: _model
                                      //     .travelModelStruct?.wayPoint.lat,
                                      // lng: _model
                                      //     .travelModelStruct?.wayPoint.lng,
                                      lat:  31.956707868422058,
                                      lng: 35.955344248625785,
                                      label: _model.travelModelStruct?.wayPoint
                                              .label ??
                                          '',
                                      id: _model.travelModelStruct?.travel.id,
                                    );
                                    if ((_model.apiResult51f?.succeeded ??
                                        true)) {
                                      setState(() {
                                        _model.isLoading = false;
                                      });

                                      FFAppState().updatedBusessList =
                                          (getJsonField(
                                        (_model.apiResult51f?.jsonBody ?? ''),
                                        r'''$.buses''',
                                        true,
                                      )!
                                                      .toList()
                                                      .map<BusModelStruct?>(
                                                          BusModelStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<BusModelStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<BusModelStruct>();
                                      if (widget.isFromSide == true) {
                                        while (context.canPop() == true) {
                                          context.pop();
                                        }
                                        context.pushReplacementNamed('MapPage');
                                      }else{
                                        while (context.canPop() == true) {
                                          context.pop();
                                        }
                                        context.pushReplacementNamed('MapPage');
                                      }

                                    } else {
                                      setState(() {
                                        _model.isLoading = false;
                                      });
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
                                            content: Text(
                                                _model.apiResult51f?.bodyText ??
                                                    ''),
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
                                  } else {
                                    if (_model.textController.text.isEmpty) {
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
                                            content: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Add Tracking distance',
                                              arText: 'قم باضافة مسافة للتتبع',
                                            )),
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
                                      return;
                                    }
                                    if (_model.counter <= 0) {
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
                                            content: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Add Tracking distance',
                                              arText: 'قم باضافة مسافة للتتبع',
                                            )),
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
                                      return;
                                    }
                                    if (_model.wayPoint.lat == 0) {
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
                                            content: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Select Trip',
                                              arText: 'قم باختيار رحلة',
                                            )),
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
                                      return;
                                    }

                                    setState(() {
                                      _model.isLoading = true;
                                    });

                                    _model.apiResult51f = await StudentApisGroup
                                        .startTrackingBusesCall
                                        .call(
                                      token: FFAppState().userModel.token,
                                      currentLat: widget.latitude,
                                      currentLng: widget.longitude,
                                      range: _model.counter,
                                      lat: _model.wayPoint.lat,
                                      lng: _model.wayPoint.lng,
                                      label: _model.wayPoint.label ?? '',
                                      id: _model.travelModelStruct?.id,
                                    );
                                    if ((_model.apiResult51f?.succeeded ??
                                        true)) {
                                      setState(() {
                                        _model.isLoading = false;

                                        FFAppState().updatedBusessList =
                                            (getJsonField(
                                          (_model.apiResult51f?.jsonBody ?? ''),
                                          r'''$.buses''',
                                          true,
                                        )!
                                                        .toList()
                                                        .map<BusModelStruct?>(
                                                            BusModelStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        BusModelStruct?>)
                                                .withoutNulls
                                                .toList()
                                                .cast<BusModelStruct>();
                                        while (context.canPop() == true) {
                                          context.pop();
                                        }
                                        context.pushReplacement('MapPage');
                                      });
                                    } else {
                                      setState(() {
                                        _model.isLoading = false;
                                      });
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
                                            content: Text(
                                                _model.apiResult51f?.bodyText ??
                                                    ''),
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
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _model.isLoading,
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
