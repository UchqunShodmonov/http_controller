import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class HttpResponse {
  int? statusCode;
  Map<String, dynamic>? response;
  HttpResponse({
    this.response,
    this.statusCode,
  });
}

class HttpController {
  Future<HttpResponse> get({
    required String path,
    Map<String, String>? headers,
  }) async {
    try {
      Uri uri = Uri.parse(path);
      var response = await http.get(
        uri,
        headers: headers ?? {},
      );
      log("<-GET-> $path \n <-Response StatusCode -> ${response.statusCode} \n<-Response Body -> ${response.body}");
      HttpResponse data = HttpResponse();
      data.statusCode = response.statusCode;
      if (response.body.isNotEmpty && response.body.contains(':')) {
        data.response = jsonDecode(utf8.decode(response.bodyBytes));
      }
      return data;
    } catch (ee) {
      throw Exception();
    }
  }

  Future<HttpResponse> post({
    required String path,
    Map<String, String>? headers,
    required Map<String, dynamic> request,
  }) async {
    try {
      Uri uri = Uri.parse(path);
      var response = await http.post(
        uri,
        headers: headers ?? {},
        body: jsonEncode(request),
      );
      log("<-POST-> $path \n<-Response StatusCode -> ${response.statusCode} \n<-Response Body -> ${response.body}");
      HttpResponse data = HttpResponse();
      data.statusCode = response.statusCode;
      if (response.body.isNotEmpty && response.body.contains(':')) {
        data.response = jsonDecode(utf8.decode(response.bodyBytes));
      }
      return data;
    } catch (ee) {
      throw Exception();
    }
  }

  Future<HttpResponse> patch({
    required String path,
    Map<String, String>? headers,
    required Map<String, dynamic> request,
  }) async {
    try {
      Uri uri = Uri.parse(path);
      var response = await http.patch(
        uri,
        headers: headers ?? {},
        body: jsonEncode(request),
      );
      log("<-PATCH-> $path \n<-Response StatusCode -> ${response.statusCode} \n<-Response Body -> ${response.body}");
      HttpResponse data = HttpResponse();
      data.statusCode = response.statusCode;
      if (response.body.isNotEmpty && response.body.contains(':')) {
        data.response = jsonDecode(utf8.decode(response.bodyBytes));
      }
      return data;
    } catch (ee) {
      throw Exception();
    }
  }

  Future<HttpResponse> delete({
    required String path,
    Map<String, String>? headers,
    required Map<String, dynamic> request,
  }) async {
    try {
      Uri uri = Uri.parse(path);
      var response = await http.delete(
        uri,
        headers: headers ?? {},
        body: jsonEncode(request),
      );
      log("<-DELETE-> $path \n<-Response StatusCode -> ${response.statusCode} \n<-Response Body -> ${response.body}");
      HttpResponse data = HttpResponse();
      data.statusCode = response.statusCode;
      if (response.body.isNotEmpty && response.body.contains(':')) {
        data.response = jsonDecode(utf8.decode(response.bodyBytes));
      }
      return data;
    } catch (ee) {
      throw Exception();
    }
  }
}
