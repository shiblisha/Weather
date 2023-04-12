part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}
class Fetchweather extends WeatherEvent{
  final String city;
  Fetchweather({required this.city});

}