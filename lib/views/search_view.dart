import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weater_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Search a City",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              //onSubmittedبتخزن القيمة المدخلة في valueوهنديها للاوبجيكت ليكتمل الريكويست
              weatherModel = await WeatherService(Dio())
                  .getCurrentWeather(cityName: value);

              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              labelText: "Search",
              hintText: "Enter a City",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//global variable
WeatherModel? weatherModel;
