import 'package:equatable/equatable.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherData extends WeatherEvent {
  final String city;

  const FetchWeatherData({this.city = 'London'});

  @override
  List<Object> get props => [city];
}