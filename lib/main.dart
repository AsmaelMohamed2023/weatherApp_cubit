import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                // primarySwatch: Colors.amber,
                appBarTheme: AppBarTheme(
                  color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.teal;
  }
  if (condition == 'Sunny' || condition == 'Clear') {
    return Colors.orange; // Group: Sunny, Clear
  } else if (condition == 'Partly cloudy' ||
      condition == 'Cloudy' ||
      condition == 'Overcast') {
    return Colors.grey; // Group: Partly cloudy, Cloudy, Overcast
  } else if (condition == 'Mist' ||
      condition == 'Fog' ||
      condition == 'Freezing fog') {
    return Colors.blueGrey; // Group: Mist, Fog, Freezing fog
  } else if (condition == 'Patchy rain possible' ||
      condition == 'Patchy light drizzle' ||
      condition == 'Light drizzle' ||
      condition == 'Patchy light rain' ||
      condition == 'Light rain') {
    return Colors.lightBlue; // Group: Rain
  } else if (condition == 'Patchy snow possible' ||
      condition == 'Patchy sleet possible' ||
      condition == 'Patchy freezing drizzle possible' ||
      condition == 'Blowing snow' ||
      condition == 'Blizzard' ||
      condition == 'Freezing drizzle' ||
      condition == 'Heavy freezing drizzle' ||
      condition == 'Patchy light snow' ||
      condition == 'Light snow' ||
      condition == 'Patchy moderate snow' ||
      condition == 'Moderate snow' ||
      condition == 'Patchy heavy snow' ||
      condition == 'Heavy snow' ||
      condition == 'Ice pellets' ||
      condition == 'Light sleet' ||
      condition == 'Moderate or heavy sleet') {
    return Colors.blue; // Group: Snow, Sleet, Ice pellets
  } else if (condition == 'Thundery outbreaks possible' ||
      condition == 'Patchy light rain with thunder' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Patchy light snow with thunder' ||
      condition == 'Moderate or heavy snow with thunder') {
    return Colors.deepOrange; // Group: Thunderstorms
  } else {
    return Colors.grey;
  }
}
