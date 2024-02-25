import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitalState extends WeatherState {}

class WeatherLoaderState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaderState({required this.weatherModel});
}

class WeatherFailtureState extends WeatherState {}
