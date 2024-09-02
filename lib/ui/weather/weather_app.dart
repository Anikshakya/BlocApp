import 'package:blocapp/bloc/weather_bloc/weather_bloc.dart';
import 'package:blocapp/bloc/weather_bloc/weather_event.dart';
import 'package:blocapp/bloc/weather_bloc/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  context.read<WeatherBloc>().add(const FetchWeatherData(city: "Nepal"));
                },
                child: const Text("Kathmandu"),
              ),
              TextButton(
                onPressed: () {
                  context.read<WeatherBloc>().add(const FetchWeatherData(city: "Tokyo"));
                },
                child: const Text("Tokyo"),
              ),
              TextButton(
                onPressed: () {
                  context.read<WeatherBloc>().add(const FetchWeatherData(city: "New York"));
                },
                child: const Text("New York"),
              ),
            ],
          ),
          const SizedBox(height: 60,),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherData) {
                final weather = state.weatherData;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '${weather.location?.name ?? "Unknown Location"}, ${weather.location?.country ?? "Unknown Country"}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '${weather.current?.tempC ?? 0.0}°C / ${weather.current?.tempF ?? 0.0}°F',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Condition: ${weather.current?.condition?.text ?? "Unknown"}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Feels Like: ${weather.current?.feelslikeC ?? 0.0}°C / ${weather.current?.feelslikeF ?? 0.0}°F',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Humidity: ${weather.current?.humidity ?? 0}%',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Wind: ${weather.current?.windMph ?? 0.0} mph / ${weather.current?.windKph ?? 0.0} kph',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                );
              }

              if (state is WeatherLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return const Center(child: Text("Something went wrong"));
            },
          ),
        ],
      ),
    );
  }
}
