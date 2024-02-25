import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/info_weather_body.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const SearchView();
                },
              ));
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      //Integrate cubit
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitalState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoaderState) {
            return InfoWeatherBody(
              weather: state.weatherModel,
            );
          } else {
            return const Text('Opps there was an error');
          }
        },
      ),
    );
  }
}
