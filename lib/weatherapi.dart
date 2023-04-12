import 'dart:convert';


import 'package:http/http.dart';
import 'package:weather/weathermodel.dart';
import 'package:weather/wether_api_client.dart';

class WetherApi{


  ApiClient apiClient = ApiClient();



  Future<Weathermodel> getWeather(
  {required String city}
      ) async {
    String trendingpath = 'https://weather-by-api-ninjas.p.rapidapi.com/v1/weather?city=$city';

    Response response = await apiClient.invokeAPI(trendingpath, 'GET1', null);

    return Weathermodel.fromJson(jsonDecode(response.body));


  }

}
