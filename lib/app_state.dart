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
    _updatedBusessList = value;
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
