import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _slectedLanguge = prefs.getString('ff_slectedLanguge') ?? _slectedLanguge;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userModel')) {
        try {
          final serializedData = prefs.getString('ff_userModel') ?? '{}';
          _userModel =
              UserModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _profileImage = prefs.getString('ff_profileImage') ?? _profileImage;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_tripTravileModel')) {
        try {
          final serializedData = prefs.getString('ff_tripTravileModel') ?? '{}';
          _tripTravileModel =
              TravelModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _coordinates = prefs
              .getStringList('ff_coordinates')
              ?.map((x) {
                try {
                  return CoordinatesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _coordinates;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _slectedLanguge = 'en';

  String get slectedLanguge => _slectedLanguge;

  set slectedLanguge(String value) {
    _slectedLanguge = value;
    prefs.setString('ff_slectedLanguge', value);
  }

  UserModelStruct _userModel = UserModelStruct();

  UserModelStruct get userModel => _userModel;

  set userModel(UserModelStruct value) {
    _userModel = value;
    prefs.setString('ff_userModel', value.serialize());
  }

  void updateUserModelStruct(Function(UserModelStruct) updateFn) {
    updateFn(_userModel);
    prefs.setString('ff_userModel', _userModel.serialize());
  }

  List<BusModelStruct> _updatedBusessList = [];

  List<BusModelStruct> get updatedBusessList => _updatedBusessList;

  set updatedBusessList(List<BusModelStruct> value) {
    // _updatedBusessList = value;
    _updatedBusessList = [
      BusModelStruct(
          busId: '655cd5e89b2c502dd0598111',
          busIdentity: '122',
          lat: 31.994232,
          lng: 35.887132,
          coordinates: [
            CoordinatesStruct(latitude: 31.999966, longitude: 35.878256),
            CoordinatesStruct(latitude: 31.997597, longitude: 35.881867),
            CoordinatesStruct(latitude: 31.994598, longitude: 35.886712),
            CoordinatesStruct(latitude: 31.993148, longitude: 35.887038)
          ])
    ];
  }

  void addToUpdatedBusessList(BusModelStruct value) {
    _updatedBusessList.add(value);
  }

  void removeFromUpdatedBusessList(BusModelStruct value) {
    _updatedBusessList.remove(value);
  }

  void removeAtIndexFromUpdatedBusessList(int index) {
    _updatedBusessList.removeAt(index);
  }

  void updateUpdatedBusessListAtIndex(
    int index,
    BusModelStruct Function(BusModelStruct) updateFn,
  ) {
    _updatedBusessList[index] = updateFn(_updatedBusessList[index]);
  }

  void insertAtIndexInUpdatedBusessList(int index, BusModelStruct value) {
    _updatedBusessList.insert(index, value);
  }

  String _profileImage = '';

  String get profileImage => _profileImage;

  set profileImage(String value) {
    _profileImage = value;
    prefs.setString('ff_profileImage', value);
  }

  TravelModelStruct _tripTravileModel = TravelModelStruct();

  TravelModelStruct get tripTravileModel => _tripTravileModel;

  set tripTravileModel(TravelModelStruct value) {
    _tripTravileModel = value;
    prefs.setString('ff_tripTravileModel', value.serialize());
  }

  void updateTripTravileModelStruct(Function(TravelModelStruct) updateFn) {
    updateFn(_tripTravileModel);
    prefs.setString('ff_tripTravileModel', _tripTravileModel.serialize());
  }

  List<CoordinatesStruct> _coordinates = [];
  List<CoordinatesStruct> get coordinates => _coordinates;
  set coordinates(List<CoordinatesStruct> value) {
    _coordinates = value;
    prefs.setStringList(
        'ff_coordinates', value.map((x) => x.serialize()).toList());
  }

  void addToCoordinates(CoordinatesStruct value) {
    _coordinates.add(value);
    prefs.setStringList(
        'ff_coordinates', _coordinates.map((x) => x.serialize()).toList());
  }

  void removeFromCoordinates(CoordinatesStruct value) {
    _coordinates.remove(value);
    prefs.setStringList(
        'ff_coordinates', _coordinates.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCoordinates(int index) {
    _coordinates.removeAt(index);
    prefs.setStringList(
        'ff_coordinates', _coordinates.map((x) => x.serialize()).toList());
  }

  void updateCoordinatesAtIndex(
    int index,
    CoordinatesStruct Function(CoordinatesStruct) updateFn,
  ) {
    _coordinates[index] = updateFn(_coordinates[index]);
    prefs.setStringList(
        'ff_coordinates', _coordinates.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCoordinates(int index, CoordinatesStruct value) {
    _coordinates.insert(index, value);
    prefs.setStringList(
        'ff_coordinates', _coordinates.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
