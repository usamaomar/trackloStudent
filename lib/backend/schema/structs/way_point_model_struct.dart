// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WayPointModelStruct extends BaseStruct {
  WayPointModelStruct({
    double? lat,
    double? lng,
    String? label,
    bool? disabled,
    String? time,
    String? id,
  })  : _lat = lat,
        _lng = lng,
        _label = label,
        _disabled = disabled,
        _time = time,
        _id = id;

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

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;
  bool hasLabel() => _label != null;

  // "disabled" field.
  bool? _disabled;
  bool get disabled => _disabled ?? false;
  set disabled(bool? val) => _disabled = val;
  bool hasDisabled() => _disabled != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;
  bool hasTime() => _time != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static WayPointModelStruct fromMap(Map<String, dynamic> data) =>
      WayPointModelStruct(
        lat: castToType<double>(data['lat']),
        lng: castToType<double>(data['lng']),
        label: data['label'] as String?,
        disabled: data['disabled'] as bool?,
        time: data['time'] as String?,
        id: data['id'] as String?,
      );

  static WayPointModelStruct? maybeFromMap(dynamic data) => data is Map
      ? WayPointModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lat': _lat,
        'lng': _lng,
        'label': _label,
        'disabled': _disabled,
        'time': _time,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'disabled': serializeParam(
          _disabled,
          ParamType.bool,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static WayPointModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      WayPointModelStruct(
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
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        disabled: deserializeParam(
          data['disabled'],
          ParamType.bool,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WayPointModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WayPointModelStruct &&
        lat == other.lat &&
        lng == other.lng &&
        label == other.label &&
        disabled == other.disabled &&
        time == other.time &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([lat, lng, label, disabled, time, id]);
}

WayPointModelStruct createWayPointModelStruct({
  double? lat,
  double? lng,
  String? label,
  bool? disabled,
  String? time,
  String? id,
}) =>
    WayPointModelStruct(
      lat: lat,
      lng: lng,
      label: label,
      disabled: disabled,
      time: time,
      id: id,
    );
