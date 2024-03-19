// import 'dart:async';
// import 'dart:io';
// import 'dart:math';
// import 'dart:io';
//   import 'dart:typed_data';

import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackllo_student/backend/schema/structs/index.dart';
import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'map_page_model.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart' as lats;

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({super.key});

  @override
  State<MapPageWidget> createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late MapPageModel _model;
  late GoogleMapController mapController;
  late Set<Marker> markers;

  final mainRef = FirebaseDatabase.instance;
  Position? currentPosition;
  late Set<Polyline> _polylines;
  List<lats.LatLng> polylineCoordinates = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    markers = <Marker>{};
    _polylines = <Polyline>{};
    update();
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _determinePosition().then((value) {
        setState(() {
          currentPosition = value;
          mapController.animateCamera(CameraUpdate.newLatLngZoom(
              lats.LatLng(currentPosition?.latitude ?? 0,
                  currentPosition?.longitude ?? 0),
              18));
        });
      });
    });
    _model = createModel(context, () => MapPageModel());
  }

  void update() {
    //
    if (FFAppState().updatedBusessList.isNotEmpty) {
      addBasicValuesOnMap();
      _addPolyline();
      for (var element in FFAppState().updatedBusessList) {
        mainRef
            .ref()
            .child('live-locations')
            .child(element.busId)
            .onValue
            .listen((event) {
          if (event.snapshot.exists) {
            Map<dynamic, dynamic> maps =
                event.snapshot.value as Map<Object?, Object?>;
            mapController.showMarkerInfoWindow(MarkerId(element.busId));
            // mapController.showMarkerInfoWindow(const MarkerId('assets/images/artboar.png'));
            // mapController.showMarkerInfoWindow(const MarkerId('assets/images/Group.png'));
            // mapController.showMarkerInfoWindow(const MarkerId('assets/images/cc.png'));
            addPointAsMarker(element.busId, maps['lat'], maps['lng'],
                "assets/images/bus_5.png", "236/2",100);
          }
        });
      }
    }
  }

  void _addPolyline() {
    setState(() {
      _polylines.add(Polyline(
        polylineId: PolylineId("poly"),
        color: Colors.blue,
        width: 3,
        points: polylineCoordinates,
      ));

      for (var element in FFAppState().coordinates) {
        polylineCoordinates.add(lats.LatLng(
            element.latitude, element.longitude));
      }
    });
  }

  void addBasicValuesOnMap() {
    WayPointModelStruct? startPoint;
    WayPointModelStruct? endPoint;
    WayPointModelStruct? wayPoint;
    if (FFAppState().tripTravileModel.travel.way == 'go') {
      startPoint = FFAppState().tripTravileModel.travel.wayPoints.first;
      endPoint = FFAppState().tripTravileModel.travel.wayPoints.last;
    } else {
      endPoint = FFAppState().tripTravileModel.travel.wayPoints.first;
      startPoint = FFAppState().tripTravileModel.travel.wayPoints.last;
    }
    wayPoint = FFAppState().tripTravileModel.wayPoint;
    addPointAsMarker('assets/images/artboar.png', startPoint.lat,
        startPoint.lng, 'assets/images/artboar.png',startPoint.label,100);
    addPointAsMarker('assets/images/Group.png', endPoint.lat, endPoint.lng,
        'assets/images/Group.png',endPoint.label,100);
    addPointAsMarker('assets/images/cc.png', wayPoint.lat, wayPoint.lng,
        'assets/images/cc.png',wayPoint.label,100);
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
                  // addCustomMarker("element.busId", 31.994911, 35.887722,
                  //     "assets/images/bus_5.png", "225/23",100);
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
          child: Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                markers: markers,
                initialCameraPosition: const CameraPosition(
                  target: lats.LatLng(31.987482, 35.884539),
                  zoom: 10.4746,
                ),
                polylines: _polylines,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
                                  duration: const Duration(milliseconds: 4000),
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
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
      String path, int width) async {
    final Uint8List? imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData!);
  }

  void addPointAsMarker(
      String id, double lat, double lng, String marker,String valueOfUpdatedObject,int value ) async {
    await getBitmapDescriptorFromAssetBytes(marker, value).then((icon) {
      setState(() {
        markers.add(Marker(
          markerId: MarkerId(id),
          position: lats.LatLng(lat, lng),
          draggable: false,
          icon: icon,
          infoWindow: InfoWindow(
            title: valueOfUpdatedObject,
          ),
        ));
      });
    });
  }

  Future<BitmapDescriptor> getCustomIcon(String marker) async {
    return SizedBox(
      height: 50,
      width: 50,
      child: Image.asset(marker),
    ).toBitmapDescriptor();
  }

  void addCustomMarker(
      String id, double lat, double lng, String marker,String valueOfUpdatedObject,int value , Function click ) async {
    await getCustomIcon(marker).then((value) {
      markers.add(Marker(
          markerId: MarkerId(id),
          position: lats.LatLng(lat, lng),
          draggable: false,
          icon:value
      ));
    }).whenComplete(() {
      click.call();
    });
  }

}
