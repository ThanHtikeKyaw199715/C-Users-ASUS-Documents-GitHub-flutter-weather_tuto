
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@ JsonSerializable()
class WeatherModel extends Equatable{
  @override

  List<Object>get props => [

    weatherStateName,weatherStateAbbr,created,maxTemp,minTemp,theTemp,windSpeed,
    windDirection

  ];

  @JsonKey(name: "weather_state_name")
  final String weatherStateName;
  @JsonKey(name: "weather_state_abbr")
  final String weatherStateAbbr;
  final String created;
  @JsonKey(name: "min_temp")
  final double minTemp;
  @JsonKey(name: "max_temp")
  final double maxTemp;
  @JsonKey(name: "the_temp")
  final double theTemp;
  @JsonKey(name: "wind_speed")
  final double windSpeed;
  @JsonKey(name: "wind_direction")
  final double windDirection;

  WeatherModel({this.weatherStateName,this.weatherStateAbbr,this.created,
                  this.minTemp,this.maxTemp,this.theTemp,this.windDirection,this.windSpeed
  });

  factory WeatherModel.fromJson (Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  Map<String, dynamic > toJson() => _$WeatherModelToJson(this);

}