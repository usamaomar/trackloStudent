// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoordinatesStruct extends BaseStruct {
  CoordinatesStruct({
    double? latitude,
    double? longitude,
  })  : _latitude = latitude,
        _longitude = longitude;

  // "Latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;
  void incrementLatitude(double amount) => _latitude = latitude + amount;
  bool hasLatitude() => _latitude != null;

  // "Longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;
  void incrementLongitude(double amount) => _longitude = longitude + amount;
  bool hasLongitude() => _longitude != null;

  static CoordinatesStruct fromMap(Map<String, dynamic> data) =>
      CoordinatesStruct(
        latitude: castToType<double>(data['Latitude']),
        longitude: castToType<double>(data['Longitude']),
      );

  static CoordinatesStruct? maybeFromMap(dynamic data) => data is Map
      ? CoordinatesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Latitude': _latitude,
        'Longitude': _longitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'Longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
      }.withoutNulls;

  static CoordinatesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoordinatesStruct(
        latitude: deserializeParam(
          data['Latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['Longitude'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CoordinatesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoordinatesStruct &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode => const ListEquality().hash([latitude, longitude]);
}

CoordinatesStruct createCoordinatesStruct({
  double? latitude,
  double? longitude,
}) =>
    CoordinatesStruct(
      latitude: latitude,
      longitude: longitude,
    );
