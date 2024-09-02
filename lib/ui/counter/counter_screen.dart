import 'package:blocapp/bloc/counter/counter_bloc.dart';
import 'package:blocapp/bloc/counter/counter_event.dart';
import 'package:blocapp/bloc/counter/counter_state.dart';
import 'package:blocapp/bloc/theme_bloc/theme_bloc.dart';
import 'package:blocapp/bloc/theme_bloc/theme_event.dart';
import 'package:blocapp/ui/switch_and_slider/switch_and_slider_screen.dart';
import 'package:blocapp/ui/weather/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Bloc"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(const ToggleTheme());
            },
            icon: const Icon(Icons.sunny),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(state.count.toString(), style: const TextStyle(fontSize: 60),);
            },
            ),
          const SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  context.read<CounterBloc>().add(IncrementCounter());
                }, 
                child: const Text("Increment")
              ),
              ElevatedButton(
                onPressed: (){
                  context.read<CounterBloc>().add(DecrementCounter());
                }, 
                child: const Text("Decrement")
              ),
            ],
          ),
          const SizedBox(height: 60,),
          // Swith And Slider
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SwitchAndSlider(),));
            }, 
            child: const Text("Switch And Slider")
          ),
          const SizedBox(height: 10,),
          // Weather App
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherApp(),));
            }, 
            child: const Text("Weather")
          ),
        ],
      ),
    );
  }
}