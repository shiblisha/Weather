import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/wather.dart';
import 'package:weather/weatherapi.dart';
import 'package:weather/weathermodel.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  late Weathermodel trendingMoviesModel;
 WetherApi moviesApi=WetherApi();
  WeatherBloc() : super(WeatherInitial()) {
    on<Fetchweather>((event, emit)async {
      emit(WeatherblocLoading());
      try{

        trendingMoviesModel = await moviesApi.getWeather(city: event.city);
        emit(WeathergblocLoaded());
      } catch(e){
        emit(WeathergblocError());}
      // TODO: implement event handler
    });
  }
}
