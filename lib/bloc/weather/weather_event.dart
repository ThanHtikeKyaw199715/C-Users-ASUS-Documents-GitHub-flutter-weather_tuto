import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {
  final int cityCode;

  const FetchWeather({@required this.cityCode}): assert(cityCode != null);

  @override
  List<Object> get props => [cityCode];
}