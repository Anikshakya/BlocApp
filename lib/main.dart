import 'package:blocapp/bloc/counter/counter_bloc.dart';
import 'package:blocapp/bloc/switch_and_slider_bloc/switch_and_slider_bloc.dart';
import 'package:blocapp/bloc/theme_bloc/theme_bloc.dart';
import 'package:blocapp/bloc/theme_bloc/theme_state.dart';
import 'package:blocapp/bloc/to_do_app_bloc/to_do_bloc.dart';
import 'package:blocapp/bloc/weather_bloc/weather_bloc.dart';
import 'package:blocapp/ui/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc(),),
        BlocProvider(create: (_) => CounterBloc(),),
        BlocProvider(create: (_) => SwitchAndSliderBloc(),),
        BlocProvider(create: (_) => ToDoBloc(),),
        BlocProvider(create: (_) => WeatherBloc(),),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bloc App',
            theme: state.themeData,
            home: const CounterScreen(),
          );
        },
      ),
    );
  }
}
