import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  //baseUrl to refactore code whein it change
  //https://api.weatherapi.com/v1/forecast.json?key=6cd5793c460c43479a680001241702&q=cairo&days=1
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '6cd5793c460c43479a680001241702';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMassege = e.response?.data['error']['message'] ??
          'OPPS there was an error, try later.';
      throw Exception(errMassege);
    } catch (e) {
      log(e.toString());
      throw Exception('OPPS there was an error, try later.');
    }
  }
}
