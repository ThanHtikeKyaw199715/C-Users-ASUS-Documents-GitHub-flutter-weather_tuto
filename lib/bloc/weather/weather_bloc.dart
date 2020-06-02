import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_tuto/network/api_service.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final ApiService api;

  WeatherBloc({@required this.api}): assert(api != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(
      WeatherEvent event,
      ) async* {
    if(event is FetchWeather) {
      yield WeatherLoading();
      try {
        final response = await api.getWeather(event.cityCode);
        yield WeatherLoaded(weathersModel: response);
      } on SocketException {
        yield WeatherError();
      } on Exception {
        yield WeatherError();
      }
    }
  }
}