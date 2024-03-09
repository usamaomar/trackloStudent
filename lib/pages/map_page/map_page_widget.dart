// import 'dart:async';
// import 'dart:io';
// import 'dart:math';
// import 'dart:io';
//   import 'dart:typed_data';

import 'package:flutter/services.dart';
// import 'package:flutter_io_socket/flutter_io_socket.dart';
// import 'package:flutter_io_socket/flutter_io_socket.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:socket_io_client/socket_io_client.dart';
// import 'package:socket_io_client/socket_io_client.dart';
// import 'package:socket_io_client/socket_io_client.dart';
// import 'package:socket_io_client_flutter/socket_io_client_flutter.dart';
// import 'package:socket_io_client/socket_io_client.dart';
// import 'package:socket_io_client/socket_io_client.dart';
// import 'package:trackllo_student/backend/schema/structs/bus_model_struct.dart';

// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

import '/components/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'map_page_model.dart';
// export 'map_page_model.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client_flutter/socket_io_client_flutter.dart'  as IO;
// import 'package:socket_io_client/socket_io_client_flutter.dart' as IO;

// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_client/web_socket_client.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart' as lats;
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({super.key});

  @override
  State<MapPageWidget> createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late MapPageModel _model;
  late GoogleMapController mapController;
  late Set<Marker> markers;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    markers = <Marker>{};
    addCustomIcon();
    // updateDate();
    super.initState();

    _model = createModel(context, () => MapPageModel());
  }
  // late   Socket socket;
  // void updateDate() async {
  //   // try {
  //
  //
  //     print('yeeeeeeeeeeeeeeeddddd');
  //     // IO.Socket socket = IO.io('https://socket-node-7ea99e615b2f.herokuapp.com/', <String, dynamic>{
  //     //   'transports': ['websocket'],
  //     //
  //     //   'autoConnect': false,
  //     // });
  //     wss://CLUSTER_ID.piesocket.com/v3/ROOM_ID?api_key=API_KEY
  //
  //     // IO.Socket socket =  IO.io('https://socket-node-7ea99e615b2f.herokuapp.com/',<String,dynamic>{
  //     // 'autoConnect':false,
  //     // 'transports':['websocket'],
  //     // });
  //     // socket.connect();
  //     // socket.onConnect((data) {
  //     //   print('connect $data');
  //     // });
  //     // socket.onDisconnect((dis) {
  //     //   print('disconnect $dis');
  //     // });
  //     // socket.onError((data) {
  //     //   print('error');
  //     // });
  //     // socket.onConnecting((data) {
  //     //   print('connecting');
  //     // });
  //     // socket.on('location', (data) {
  //     //   print('$data');
  //     // });
  //     // socket.onConnectError((data) {
  //     //   print('connect Error');
  //     // });
  //     // socket.onConnectTimeout((data) {
  //     //   print('timeout');
  //     // });
  //     // socket.onevent({'dd':'sss'});
  //     // socket.onAny((event, data) {
  //     //   print('timeout');
  //     // });
  //     // socket.onPing((data) {
  //     //   print('timeout');
  //     // });
  //     // socket.onPong((data) {
  //     //   print('timeout');
  //     // });
  //
  //
  //
  //
  //
  //     // Random r = new Random();
  //     // String key = base64.encode(List<int>.generate(8, (_) => r.nextInt(256)));
  //
  //     // HttpClient client = HttpClient(/* optional security context here */);
  //     // HttpClientRequest request = await client.get('https://socket-node-7ea99e615b2f.herokuapp.com', 80,
  //     //     '/'); // form the correct url here
  //     // request.headers.add('Connection', 'upgrade');
  //     // request.headers.add('Upgrade', 'websocket');
  //     // request.headers.add('sec-websocket-version', '13'); // insert the correct version here
  //     // // request.headers.add('sec-websocket-key', key);
  //     //
  //     // HttpClientResponse response = await request.close();
  //     // // todo check the status code, key etc
  //     //  await response.detachSocket().catchError((onError){
  //     //    print('object');
  //     //  }).then((value) {
  //     //    print('object');
  //     //  });
  //
  //     // WebSocket ws = WebSocket.fromUpgradedSocket(
  //     //   socket,
  //     //   serverSide: false,
  //     // );
  //
  //     // socket.sendConnectPacket({"data":"ok"});
  //
  //     //
  //     //
  //     // Socket.connect("https://socket-node-7ea99e615b2f.herokuapp.com", 1030).then((Socket socket) {
  //     //   socket.listen((dataHandler){
  //     //     print("te");
  //     //   },onError: (errorHandler){
  //     //         print("Unc");
  //     //       },
  //     //       onDone: (){
  //     //         print("Uxx");
  //     //       },cancelOnError: false);
  //     // }).catchError((e) {
  //     //   print("Unable to connect: $e");
  //     // });
  //
  //
  //     // socket =   io('https://tracllo-node-178a480f7a89.herokuapp.com/', <String, dynamic>{
  //     // 'transports': ['websocket'],
  //     // 'autoConnect': false,
  //     // // 'forceNew': true,
  //     //   // 'transports': ['polling'],
  //     //   // 'port': '443',
  //     //   'extraHeaders': {'Authorization': FFAppState().userModel.token},
  //     // });
  //
  //     // socket.connect();
  //     //
  //     // socket.on("connect", (_) {
  //     //   print('Connected');
  //     //   // Timer.periodic(const Duration(seconds: 1), (Timer countDownTimer) {
  //     //   //   socket.emit('toServer',  {'key': 'hello', 'value': 'world'});
  //     //   // });
  //     // });
  //     // socket.on("fromServer", (_) {
  //     //   print('fromServer $_');
  //     // });
  //     //
  //
  //
  //     // socket.on('connect_error', (value) {
  //     //   print('connect error ${value.toString()}');
  //     // });
  //     //
  //     // //When an event recieved from server, data is added to the stream
  //
  //
  //
  //
  //     // Socket socket = io('http://localhost:3000',
  //     //     OptionBuilder()
  //     //         .setTransports(['websocket']) // for Flutter or Dart VM
  //     //         .disableAutoConnect()  // disable auto-connection
  //     //         .setExtraHeaders({'foo': 'bar'}) // optional
  //     //         .build()
  //     // );
  //     // socket.connect();
  //
  //     // IO.Socket socket = IO.io(
  //     //     'https://tracllo-node-178a480f7a89.herokuapp.com',
  //     //     OptionBuilder()
  //     //         .setTransports(['websocket'])
  //     //         .disableAutoConnect()
  //     //         .disableAutoConnect()
  //     //         .build());
  //     // // socket.connect();
  //     // socket.onConnect((_) {
  //     //   print('connect');
  //     // });
  //     // socket.onDisconnect((error) {
  //     //   print('object');
  //     // });
  //     // // socket.on('fromServer', (error) {
  //     // //   print('object');
  //     // // });
  //     // socket.on('test', (data) {
  //     //   print('object');
  //     // });
  //     //
  //     //
  //     // socket.onError((data) {
  //     //   print('object');
  //     // });
  //
  //   // socket.onDisconnect((data) => {print('object')});
  //
  //   // final uri = Uri.parse('ws://tracllo-node-178a480f7a89.herokuapp.com');
  //   // final uri = Uri.parse(
  //   //     'wss://free.blr2.piesocket.com/v3/1?api_key=sLX4pLahmfUQ0kFI4FxNwUT9KbEECXCM6MmmEDUS&notify_self=1');
  //   // final socket = WebSocket(uri);
  //   // socket.connection.listen((state) {
  //   //   setState(() {
  //   //     FFAppState().updatedBusessList.add(
  //   //           BusModelStruct(
  //   //               busId: 'oisdmfoimsdf',
  //   //               busIdentity: '4444',
  //   //               lat: 31.9936463,
  //   //               lng: 35.8881964,
  //   //               maDistance: 20),
  //   //         );
  //   //     FFAppState().updatedBusessList.add(
  //   //           BusModelStruct(
  //   //               busId: 'ccjjjkjkjk',
  //   //               busIdentity: '99909',
  //   //               lat: 31.9942722,
  //   //               lng: 35.8876487,
  //   //               maDistance: 20),
  //   //         );
  //   //
  //   //     mapController.moveCamera(CameraUpdate.newLatLng(
  //   //       lats.LatLng(
  //   //           FFAppState().updatedBusessList.isNotEmpty
  //   //               ? FFAppState().updatedBusessList[0].lat
  //   //               : 0.0,
  //   //           FFAppState().updatedBusessList.isNotEmpty
  //   //               ? FFAppState().updatedBusessList[0].lng
  //   //               : 0.0),
  //   //     ));
  //   //     FFAppState().updatedBusessList.forEach((element) {
  //   //       markers.add(Marker(
  //   //         markerId: const MarkerId("marker1"),
  //   //         position: lats.LatLng(element.lat, element.lng),
  //   //         draggable: false,
  //   //         icon: markerIcon,
  //   //       ));
  //   //     });
  //   //   });
  //   // });
  //   // // Listen for incoming messages.
  //   // socket.messages.listen((message) {
  //   //   print('');
  //   // });
  //
  //   // } catch (ex) {
  //   //   ex.toString();
  //   // }
  // }

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
          child: Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                markers: markers,
                initialCameraPosition: CameraPosition(
                  target: lats.LatLng(
                      FFAppState().updatedBusessList.isNotEmpty
                          ? FFAppState().updatedBusessList[0].lat
                          : 0.0,
                      FFAppState().updatedBusessList.isNotEmpty
                          ? FFAppState().updatedBusessList[0].lng
                          : 0.0),
                  zoom: 14.4746,
                ),
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

  void addCustomIcon() async {
    await getBitmapDescriptorFromAssetBytes("assets/images/bus_5.png", 100)
        .then((icon) {
      setState(() {
        markerIcon = icon;
        // dynamic line = FFAppState().travilLine;
        //
        // if(line!=null) {
        //   for (var setting in line['way_points']) {
        //     markers.add(Marker(
        //       markerId: MarkerId(setting['label']),
        //       position: lats.LatLng(
        //           setting['lat'].toDouble(), setting['lng'].toDouble()),
        //       draggable: false,
        //       icon: BitmapDescriptor.defaultMarkerWithHue(
        //           BitmapDescriptor.hueGreen),
        //     ));
        //   }
        // }
      });
    });
  }
}
