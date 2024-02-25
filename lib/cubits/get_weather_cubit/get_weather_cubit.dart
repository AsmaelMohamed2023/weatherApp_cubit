import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weater_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  //InitalState()الاستات في حالة اول البرنامج
  GetWeatherCubit() : super(WeatherInitalState());
  WeatherModel? weatherModel;
  //funالمسئولة عن جزب البيانات
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      //emitترسل الاستات في حالةتوفر الداتا
      emit(WeatherLoaderState(weatherModel: weatherModel!));
    } catch (e) {
      //ابعت الاستات في حالة الاكسبشن
      emit(WeatherFailtureState());
    }
  }
}
