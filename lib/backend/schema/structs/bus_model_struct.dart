// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusModelStruct extends BaseStruct {
  BusModelStruct({
    String? busld,
    String? busIdentity,
    double? lat,
    double? ing,
    double? maDistance,
    List<double>? startPoint,
  })  : _busld = busld,
        _busIdentity = busIdentity,
        _lat = lat,
        _ing = ing,
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

  // "Ing" field.
  double? _ing;
  double get ing => _ing ?? 0.0;
  set ing(double? val) => _ing = val;
  void incrementIng(double amount) => _ing = ing + amount;
  bool hasIng() => _ing != null;

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
        ing: castToType<double>(data['Ing']),
        maDistance: castToType<double>(data['maDistance']),
        startPoint: getDataList(data['startPoint']),
      );

  static BusModelStruct? maybeFromMap(dynamic data) =>
      data is Map ? BusModelStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'busld': _busld,
        'busIdentity': _busIdentity,
        'lat': _lat,
        'Ing': _ing,
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
        'Ing': serializeParam(
          _ing,
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
        ing: deserializeParam(
          data['Ing'],
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
        ing == other.ing &&
        maDistance == other.maDistance &&
        listEquality.equals(startPoint, other.startPoint);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([busld, busIdentity, lat, ing, maDistance, startPoint]);
}

BusModelStruct createBusModelStruct({
  String? busld,
  String? busIdentity,
  double? lat,
  double? ing,
  double? maDistance,
}) =>
    BusModelStruct(
      busld: busld,
      busIdentity: busIdentity,
      lat: lat,
      ing: ing,
      maDistance: maDistance,
    );
