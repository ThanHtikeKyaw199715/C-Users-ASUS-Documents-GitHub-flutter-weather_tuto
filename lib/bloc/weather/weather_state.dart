import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_tuto/network/model/models.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];

}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeathersModel weathersModel;

  const WeatherLoaded({@required this.weathersModel}) : assert(weathersModel != null);

  @override
  List<Object> get props => [weathersModel];

}

class WeatherError extends WeatherState {}