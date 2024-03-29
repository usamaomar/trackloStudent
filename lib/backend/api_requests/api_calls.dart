import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start StudentApis Group Code

class StudentApisGroup {
  static String baseUrl = 'https://tracllo-node-178a480f7a89.herokuapp.com/api';
  static Map<String, String> headers = {
    'Authorization': '[token]',
  };
  static LoginApiCall loginApiCall = LoginApiCall();
  static GetAllTravileApiCall getAllTravileApiCall = GetAllTravileApiCall();
  static GetLastTravileApiCall getLastTravileApiCall = GetLastTravileApiCall();
  static NewsMobileApiCall newsMobileApiCall = NewsMobileApiCall();
  static StartTrackingBusesCall startTrackingBusesCall =
      StartTrackingBusesCall();
  static UploadImageApiCall uploadImageApiCall = UploadImageApiCall();
  static UpdateStudentFileCall updateStudentFileCall = UpdateStudentFileCall();
}

class LoginApiCall {
  Future<ApiCallResponse> call({
    String? password = '',
    String? phone = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "password": "$password",
  "phone": "$phone"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LoginApi',
      apiUrl: '${StudentApisGroup.baseUrl}/v1/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllTravileApiCall {
  Future<ApiCallResponse> call({
    double? lat,
    double? lng,
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllTravileApi',
      apiUrl: '${StudentApisGroup.baseUrl}/v1/travels/closest',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '$token',
      },
      params: {
        'lat': lat,
        'lng': lng,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLastTravileApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetLastTravileApi',
      apiUrl: '${StudentApisGroup.baseUrl}/v1/travels/tracked',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '$token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class NewsMobileApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'NewsMobileApi',
      apiUrl: '${StudentApisGroup.baseUrl}/v1/news-mobile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '$token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class StartTrackingBusesCall {
  Future<ApiCallResponse> call({
    double? currentLat,
    double? currentLng,
    dynamic wayPointJson,
    int? range,
    double? lat,
    double? lng,
    String? label = '',
    String? id = '',
    String? token = '',
  }) async {
    final wayPoint = _serializeJson(wayPointJson);
    final ffApiRequestBody = '''
{
  "currentLat": $currentLat,
  "currentLng": $currentLng,
  "wayPoint": {
    "lat": $lat,
    "lng": $lng,
    "label": "$label"
  },
  "range": $range
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'startTrackingBuses',
      apiUrl: '${StudentApisGroup.baseUrl}/v1/travels/$id/startTrackingBuses',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadImageApiCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UploadImageApi',
      apiUrl: '${StudentApisGroup.baseUrl}/image',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '$token',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateStudentFileCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? studentId = '',
    String? profilePhoto = '',
    String? phoneNumber = '',
    String? password = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "$name",
  "student_id": "$studentId",
  "profile_photo": "$profilePhoto",
  "phone_number": "$phoneNumber",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateStudentFile',
      apiUrl: '${StudentApisGroup.baseUrl}/students/$studentId',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': '$token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End StudentApis Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
