// weather_bloc.dart
import 'dart:convert';

import 'package:blocapp/bloc/weather_bloc/weather_event.dart';
import 'package:blocapp/bloc/weather_bloc/weather_state.dart';
import 'package:blocapp/models/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherLoading()) {
    on<FetchWeatherData>((event, emit) async {
      emit(WeatherLoading());

      final city = event.city;
      final url = 'http://api.weatherapi.com/v1/current.json?key=1faad5cb9d2440c2b94115036243008&q=$city&aqi=no';

      try {
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          final weatherModel = WeatherModel.fromJson(jsonData);
          emit(WeatherData(weatherModel));
        } else {
          // emit(WeatherError("Failed to load weather data")); // Handle HTTP error status
        }
      } catch (e) {
        // emit(WeatherError("Failed to load weather data")); // Handle exceptions
      }
    });

    add(const FetchWeatherData());
  }
}
