// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsModelStruct extends BaseStruct {
  NewsModelStruct({
    String? title,
    String? description,
    String? time,
    String? date,
  })  : _title = title,
        _description = description,
        _time = time,
        _date = date;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;
  bool hasTime() => _time != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  static NewsModelStruct fromMap(Map<String, dynamic> data) => NewsModelStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        time: data['time'] as String?,
        date: data['date'] as String?,
      );

  static NewsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? NewsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'time': _time,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewsModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsModelStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NewsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewsModelStruct &&
        title == other.title &&
        description == other.description &&
        time == other.time &&
        date == other.date;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, description, time, date]);
}

NewsModelStruct createNewsModelStruct({
  String? title,
  String? description,
  String? time,
  String? date,
}) =>
    NewsModelStruct(
      title: title,
      description: description,
      time: time,
      date: date,
    );
