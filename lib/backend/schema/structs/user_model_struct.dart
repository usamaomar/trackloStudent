// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserModelStruct extends BaseStruct {
  UserModelStruct({
    String? id,
    String? name,
    String? sisCode,
    String? password,
    String? firebaseId,
    String? university,
    String? phone,
    String? profilePhoto,
    String? studentId,
    String? token,
    bool? disabled,
    bool? active,
    String? deviceId,
    String? semester,
  })  : _id = id,
        _name = name,
        _sisCode = sisCode,
        _password = password,
        _firebaseId = firebaseId,
        _university = university,
        _phone = phone,
        _profilePhoto = profilePhoto,
        _studentId = studentId,
        _token = token,
        _disabled = disabled,
        _active = active,
        _deviceId = deviceId,
        _semester = semester;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "sis_code" field.
  String? _sisCode;
  String get sisCode => _sisCode ?? '';
  set sisCode(String? val) => _sisCode = val;
  bool hasSisCode() => _sisCode != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;
  bool hasPassword() => _password != null;

  // "firebase_id" field.
  String? _firebaseId;
  String get firebaseId => _firebaseId ?? '';
  set firebaseId(String? val) => _firebaseId = val;
  bool hasFirebaseId() => _firebaseId != null;

  // "university" field.
  String? _university;
  String get university => _university ?? '';
  set university(String? val) => _university = val;
  bool hasUniversity() => _university != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "profile_photo" field.
  String? _profilePhoto;
  String get profilePhoto => _profilePhoto ?? '';
  set profilePhoto(String? val) => _profilePhoto = val;
  bool hasProfilePhoto() => _profilePhoto != null;

  // "student_id" field.
  String? _studentId;
  String get studentId => _studentId ?? '';
  set studentId(String? val) => _studentId = val;
  bool hasStudentId() => _studentId != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;
  bool hasToken() => _token != null;

  // "disabled" field.
  bool? _disabled;
  bool get disabled => _disabled ?? false;
  set disabled(bool? val) => _disabled = val;
  bool hasDisabled() => _disabled != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;
  bool hasActive() => _active != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  set deviceId(String? val) => _deviceId = val;
  bool hasDeviceId() => _deviceId != null;

  // "semester" field.
  String? _semester;
  String get semester => _semester ?? '';
  set semester(String? val) => _semester = val;
  bool hasSemester() => _semester != null;

  static UserModelStruct fromMap(Map<String, dynamic> data) => UserModelStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        sisCode: data['sis_code'] as String?,
        password: data['password'] as String?,
        firebaseId: data['firebase_id'] as String?,
        university: data['university'] as String?,
        phone: data['phone'] as String?,
        profilePhoto: data['profile_photo'] as String?,
        studentId: data['student_id'] as String?,
        token: data['token'] as String?,
        disabled: data['disabled'] as bool?,
        active: data['active'] as bool?,
        deviceId: data['deviceId'] as String?,
        semester: data['semester'] as String?,
      );

  static UserModelStruct? maybeFromMap(dynamic data) => data is Map
      ? UserModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'sis_code': _sisCode,
        'password': _password,
        'firebase_id': _firebaseId,
        'university': _university,
        'phone': _phone,
        'profile_photo': _profilePhoto,
        'student_id': _studentId,
        'token': _token,
        'disabled': _disabled,
        'active': _active,
        'deviceId': _deviceId,
        'semester': _semester,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'sis_code': serializeParam(
          _sisCode,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'firebase_id': serializeParam(
          _firebaseId,
          ParamType.String,
        ),
        'university': serializeParam(
          _university,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'profile_photo': serializeParam(
          _profilePhoto,
          ParamType.String,
        ),
        'student_id': serializeParam(
          _studentId,
          ParamType.String,
        ),
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'disabled': serializeParam(
          _disabled,
          ParamType.bool,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'deviceId': serializeParam(
          _deviceId,
          ParamType.String,
        ),
        'semester': serializeParam(
          _semester,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        sisCode: deserializeParam(
          data['sis_code'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        firebaseId: deserializeParam(
          data['firebase_id'],
          ParamType.String,
          false,
        ),
        university: deserializeParam(
          data['university'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        profilePhoto: deserializeParam(
          data['profile_photo'],
          ParamType.String,
          false,
        ),
        studentId: deserializeParam(
          data['student_id'],
          ParamType.String,
          false,
        ),
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        disabled: deserializeParam(
          data['disabled'],
          ParamType.bool,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        deviceId: deserializeParam(
          data['deviceId'],
          ParamType.String,
          false,
        ),
        semester: deserializeParam(
          data['semester'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserModelStruct &&
        id == other.id &&
        name == other.name &&
        sisCode == other.sisCode &&
        password == other.password &&
        firebaseId == other.firebaseId &&
        university == other.university &&
        phone == other.phone &&
        profilePhoto == other.profilePhoto &&
        studentId == other.studentId &&
        token == other.token &&
        disabled == other.disabled &&
        active == other.active &&
        deviceId == other.deviceId &&
        semester == other.semester;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        sisCode,
        password,
        firebaseId,
        university,
        phone,
        profilePhoto,
        studentId,
        token,
        disabled,
        active,
        deviceId,
        semester
      ]);
}

UserModelStruct createUserModelStruct({
  String? id,
  String? name,
  String? sisCode,
  String? password,
  String? firebaseId,
  String? university,
  String? phone,
  String? profilePhoto,
  String? studentId,
  String? token,
  bool? disabled,
  bool? active,
  String? deviceId,
  String? semester,
}) =>
    UserModelStruct(
      id: id,
      name: name,
      sisCode: sisCode,
      password: password,
      firebaseId: firebaseId,
      university: university,
      phone: phone,
      profilePhoto: profilePhoto,
      studentId: studentId,
      token: token,
      disabled: disabled,
      active: active,
      deviceId: deviceId,
      semester: semester,
    );
