import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:weather/wether_Api_exeption.dart';


class ApiClient {


  Future<Response> invokeAPI(String path, String method, Object? body
      ) async {
    Map<String, String> headerParams = {
      'X-RapidAPI-Key': '6499a0f8a2msh1733ea90df3962cp147597jsnc52bb35f2ed0',
      'X-RapidAPI-Host': 'weather-by-api-ninjas.p.rapidapi.com'
    };
    Response response;

    String url = path;
    print(url);

    final nullableHeaderParams = (headerParams.isEmpty) ? null : headerParams;

    switch (method) {
    case "POST":
    response = await post(Uri.parse(url), headers: {'content-Type': 'application/json',}, body: body);
    break;
    case "PUT":
    response = await put(Uri.parse(url), headers: {'content-Type': 'application/json',}, body: body);
    break;
    case "DELETE":
    response = await delete(Uri.parse(url), headers: nullableHeaderParams);
    break;
    case "POST_":
    response = await post(Uri.parse(url), headers:  {},body: body,);
    break;
    case "GET_":
    response = await post(Uri.parse(url), headers:  headerParams,body: body,);
    break;
    default:
    response = await get(Uri.parse(url), headers:headerParams);
    }

    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode >= 400) {
    log(path +
    ' : ' +
    response.statusCode.toString() +
    ' : ' +
    response.body);

    throw ApiException(
    message: _decodeBodyBytes(response), statusCode: response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers['content-type'];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}

