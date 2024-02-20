// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusModelStruct extends BaseStruct {
  BusModelStruct({
    String? busld,
    String? busIdentity,
    double? lat,
    double? lng,
    double? maDistance,
    List<double>? startPoint,
  })  : _busld = busld,
        _busIdentity = busIdentity,
        _lat = lat,
        _lng = lng,
        _maDistance = maDistance,
        _startPoint = startPoint;

  // "busld" field.
  String? _busld;
  String get busld => _busld ?? '';
  set busld(String? val) => _busld = val;
  bool hasBusld() => _busld != null;

  // "busIdentity" field.
  String? _busIdentity;
  String get busIdentity => _busIdentity ?? '';
  set busIdentity(String? val) => _busIdentity = val;
  bool hasBusIdentity() => _busIdentity != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;
  void incrementLat(double amount) => _lat = lat + amount;
  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;
  void incrementLng(double amount) => _lng = lng + amount;
  bool hasLng() => _lng != null;

  // "maDistance" field.
  double? _maDistance;
  double get maDistance => _maDistance ?? 0.0;
  set maDistance(double? val) => _maDistance = val;
  void incrementMaDistance(double amount) => _maDistance = maDistance + amount;
  bool hasMaDistance() => _maDistance != null;

  // "startPoint" field.
  List<double>? _startPoint;
  List<double> get startPoint => _startPoint ?? const [];
  set startPoint(List<double>? val) => _startPoint = val;
  void updateStartPoint(Function(List<double>) updateFn) =>
      updateFn(_startPoint ??= []);
  bool hasStartPoint() => _startPoint != null;

  static BusModelStruct fromMap(Map<String, dynamic> data) => BusModelStruct(
        busld: data['busld'] as String?,
        busIdentity: data['busIdentity'] as String?,
        lat: castToType<double>(data['lat']),
        lng: castToType<double>(data['lng']),
        maDistance: castToType<double>(data['maDistance']),
        startPoint: getDataList(data['startPoint']),
      );

  static BusModelStruct? maybeFromMap(dynamic data) =>
      data is Map ? BusModelStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'busld': _busld,
        'busIdentity': _busIdentity,
        'lat': _lat,
        'lng': _lng,
        'maDistance': _maDistance,
        'startPoint': _startPoint,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'busld': serializeParam(
          _busld,
          ParamType.String,
        ),
        'busIdentity': serializeParam(
          _busIdentity,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
        'maDistance': serializeParam(
          _maDistance,
          ParamType.double,
        ),
        'startPoint': serializeParam(
          _startPoint,
          ParamType.double,
          true,
        ),
      }.withoutNulls;

  static BusModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      BusModelStruct(
        busld: deserializeParam(
          data['busld'],
          ParamType.String,
          false,
        ),
        busIdentity: deserializeParam(
          data['busIdentity'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
          false,
        ),
        maDistance: deserializeParam(
          data['maDistance'],
          ParamType.double,
          false,
        ),
        startPoint: deserializeParam<double>(
          data['startPoint'],
          ParamType.double,
          true,
        ),
      );

  @override
  String toString() => 'BusModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BusModelStruct &&
        busld == other.busld &&
        busIdentity == other.busIdentity &&
        lat == other.lat &&
        lng == other.lng &&
        maDistance == other.maDistance &&
        listEquality.equals(startPoint, other.startPoint);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([busld, busIdentity, lat, lng, maDistance, startPoint]);
}

BusModelStruct createBusModelStruct({
  String? busld,
  String? busIdentity,
  double? lat,
  double? lng,
  double? maDistance,
}) =>
    BusModelStruct(
      busld: busld,
      busIdentity: busIdentity,
      lat: lat,
      lng: lng,
      maDistance: maDistance,
    );
