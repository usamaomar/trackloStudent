// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TravelModelStruct extends BaseStruct {
  TravelModelStruct({
    String? id,
    String? travelStartName,
    String? travelEndName,
    String? way,
    List<WayPointModelStruct>? wayPoints,
  })  : _id = id,
        _travelStartName = travelStartName,
        _travelEndName = travelEndName,
        _way = way,
        _wayPoints = wayPoints;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "travel_start_name" field.
  String? _travelStartName;
  String get travelStartName => _travelStartName ?? '';
  set travelStartName(String? val) => _travelStartName = val;
  bool hasTravelStartName() => _travelStartName != null;

  // "travel_end_name" field.
  String? _travelEndName;
  String get travelEndName => _travelEndName ?? '';
  set travelEndName(String? val) => _travelEndName = val;
  bool hasTravelEndName() => _travelEndName != null;

  // "way" field.
  String? _way;
  String get way => _way ?? '';
  set way(String? val) => _way = val;
  bool hasWay() => _way != null;

  // "way_points" field.
  List<WayPointModelStruct>? _wayPoints;
  List<WayPointModelStruct> get wayPoints => _wayPoints ?? const [];
  set wayPoints(List<WayPointModelStruct>? val) => _wayPoints = val;
  void updateWayPoints(Function(List<WayPointModelStruct>) updateFn) =>
      updateFn(_wayPoints ??= []);
  bool hasWayPoints() => _wayPoints != null;

  static TravelModelStruct fromMap(Map<String, dynamic> data) =>
      TravelModelStruct(
        id: data['id'] as String?,
        travelStartName: data['travel_start_name'] as String?,
        travelEndName: data['travel_end_name'] as String?,
        way: data['way'] as String?,
        wayPoints: getStructList(
          data['way_points'],
          WayPointModelStruct.fromMap,
        ),
      );

  static TravelModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TravelModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'travel_start_name': _travelStartName,
        'travel_end_name': _travelEndName,
        'way': _way,
        'way_points': _wayPoints?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'travel_start_name': serializeParam(
          _travelStartName,
          ParamType.String,
        ),
        'travel_end_name': serializeParam(
          _travelEndName,
          ParamType.String,
        ),
        'way': serializeParam(
          _way,
          ParamType.String,
        ),
        'way_points': serializeParam(
          _wayPoints,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static TravelModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TravelModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        travelStartName: deserializeParam(
          data['travel_start_name'],
          ParamType.String,
          false,
        ),
        travelEndName: deserializeParam(
          data['travel_end_name'],
          ParamType.String,
          false,
        ),
        way: deserializeParam(
          data['way'],
          ParamType.String,
          false,
        ),
        wayPoints: deserializeStructParam<WayPointModelStruct>(
          data['way_points'],
          ParamType.DataStruct,
          true,
          structBuilder: WayPointModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TravelModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TravelModelStruct &&
        id == other.id &&
        travelStartName == other.travelStartName &&
        travelEndName == other.travelEndName &&
        way == other.way &&
        listEquality.equals(wayPoints, other.wayPoints);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, travelStartName, travelEndName, way, wayPoints]);
}

TravelModelStruct createTravelModelStruct({
  String? id,
  String? travelStartName,
  String? travelEndName,
  String? way,
}) =>
    TravelModelStruct(
      id: id,
      travelStartName: travelStartName,
      travelEndName: travelEndName,
      way: way,
    );
