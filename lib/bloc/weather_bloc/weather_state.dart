import 'package:blocapp/models/weather_model.dart';
import 'package:equatable/equatable.dart';

sealed class WeatherState extends Equatable {
  final WeatherModel weatherData;

  const WeatherState(this.weatherData);
  
  @override
  List<Object> get props => [weatherData];
}

final class WeatherData extends WeatherState {
  const WeatherData(super.weatherData);
}

final class WeatherLoading extends WeatherState {
  WeatherLoading() : super(WeatherModel());
}
