import 'dart:async';
import 'dart:convert';
import 'dart:io';
 
import 'package:chopper/chopper.dart';
import 'package:shop_portal/models/data_response_model.dart';
 

 
   
class NoInternetException implements Exception {
  final message = 'You are not connection to the internet';

  @override
  String toString() => message;
}

class ErrorResponseToDataModelConverter implements ErrorConverter {
  @override
  FutureOr<Response> convertError<BodyType, InnerType>(Response response) {
    var contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (!contentType!.contains(jsonHeaders)) {
     return   response.copyWith<BodyType>(
          body: DataResponseModel(false, [], "Server Side Error") as BodyType);
    }
    if ( contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      var mapData = json.decode(body);
      var popular = DataResponseModel.fromJson(mapData);
      return response.copyWith<BodyType>(body: popular as BodyType);
    } catch (e) {
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(body: body);
    }
  }
}

class ResponseToDataModelConverter implements Converter {
  const ResponseToDataModelConverter();

  @override
  Request convertRequest(Request request) {
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );

    return encodeJson(req);
  }

  Request encodeJson(Request request) {
    var contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    var contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      var mapData = json.decode(body);
      return response.copyWith(
          body: DataResponseModel.fromJson(mapData) as BodyType);
    } catch (e) {
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(body: body);
    }
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return decodeJson<BodyType, InnerType>(response);
  }
}
