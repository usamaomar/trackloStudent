// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActiveBusesStruct extends BaseStruct {
  ActiveBusesStruct({
    String? busIdentity,
    int? availableSeats,
  })  : _busIdentity = busIdentity,
        _availableSeats = availableSeats;

  // "bus_identity" field.
  String? _busIdentity;
  String get busIdentity => _busIdentity ?? '';
  set busIdentity(String? val) => _busIdentity = val;
  bool hasBusIdentity() => _busIdentity != null;

  // "availableSeats" field.
  int? _availableSeats;
  int get availableSeats => _availableSeats ?? 0;
  set availableSeats(int? val) => _availableSeats = val;
  void incrementAvailableSeats(int amount) =>
      _availableSeats = availableSeats + amount;
  bool hasAvailableSeats() => _availableSeats != null;

  static ActiveBusesStruct fromMap(Map<String, dynamic> data) =>
      ActiveBusesStruct(
        busIdentity: data['bus_identity'] as String?,
        availableSeats: castToType<int>(data['availableSeats']),
      );

  static ActiveBusesStruct? maybeFromMap(dynamic data) => data is Map
      ? ActiveBusesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bus_identity': _busIdentity,
        'availableSeats': _availableSeats,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bus_identity': serializeParam(
          _busIdentity,
          ParamType.String,
        ),
        'availableSeats': serializeParam(
          _availableSeats,
          ParamType.int,
        ),
      }.withoutNulls;

  static ActiveBusesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ActiveBusesStruct(
        busIdentity: deserializeParam(
          data['bus_identity'],
          ParamType.String,
          false,
        ),
        availableSeats: deserializeParam(
          data['availableSeats'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ActiveBusesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ActiveBusesStruct &&
        busIdentity == other.busIdentity &&
        availableSeats == other.availableSeats;
  }

  @override
  int get hashCode => const ListEquality().hash([busIdentity, availableSeats]);
}

ActiveBusesStruct createActiveBusesStruct({
  String? busIdentity,
  int? availableSeats,
}) =>
    ActiveBusesStruct(
      busIdentity: busIdentity,
      availableSeats: availableSeats,
    );
