import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'map_page_model.dart';
export 'map_page_model.dart';
// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'dart:ui' as ui;


class MapPageWidget extends StatefulWidget {
  const MapPageWidget({super.key});

  @override
  State<MapPageWidget> createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late MapPageModel _model;
  late GoogleMapController mapController;
  late Set<Marker> markers;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    markers = <Marker>{};
    super.initState();
    updateDate();
    _model = createModel(context, () => MapPageModel());
  }


  void updateDate() async{
    try{
      final uri = Uri.parse('ws://tracllo-node-178a480f7a89.herokuapp.com');
      final socket = WebSocket(uri);
      socket.connection.listen((state) {
        print('state: "$state"');
      });
      // Listen for incoming messages.
      socket.messages.listen((message) {
        print('message: "$message"');
      });
    }catch(ex){
      ex.toString();
    }
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  Icons.notes,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                isRightHedding: false,
                isLeftHedding: true,
                title: FFLocalizations.of(context).getVariableText(
                  enText: 'Main',
                  arText: 'الرئيسية',
                ),
                rightButtonAction: () async {
                  context.pushNamed('SideMenuePage');
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // GoogleMap(
              //   zoomControlsEnabled: false,
              //   myLocationEnabled: false,
              //   myLocationButtonEnabled: false,
              //   onMapCreated: (GoogleMapController controller) {
              //     mapController = controller;
              //   },
              //   markers: markers,
              //   // initialCameraPosition: CameraPosition(
              //   //   // target: lats.LatLng(position.latitude, position.longitude),
              //   //   zoom: 14.4746,
              //   // ),
              // ),
              Container(
                width: double.infinity,
                height: 64.0,
                decoration: const BoxDecoration(
                  color: Color(0xFF6A5BF6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        checkPermition().catchError((onError) {
                          if (onError.toString().isEmpty) {
                            _determinePosition().then((value) => {
                              context.pushNamed(
                              'TrackTripsPage',
                              queryParameters: {
                                'latitude': serializeParam(
                                  value.latitude,
                                  ParamType.double,
                                ),
                                'longitude': serializeParam(
                                  value.longitude,
                                  ParamType.double,
                                ),
                              }.withoutNulls,
                            )
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: onError,
                                    arText: onError,
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }
                        });
                      },
                      text: FFLocalizations.of(context).getText(
                        'jula7u30' /* Track Trips */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            44.0, 0.0, 44.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFF6A5BF6),
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future checkPermition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('تم تعطيل تحديد خدمات الموقع.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('تم رفض تحديد الموقع');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('تم رفض تحديد الموقع بشكل دائم، ولا يمكننا طلب اذن.');
    }

    return Future.error('');
  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
