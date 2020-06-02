// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weathers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeathersModel _$WeathersModelFromJson(Map<String, dynamic> json) {
  return WeathersModel(
    title: json['title'] as String,
    locationType: json['location_type'] as String,
    timezone: json['time_zone'] as String,
    woeId: json['woeid'] as int,
    weathers: (json['consolidated_weather'] as List)
        ?.map((e) =>
            e == null ? null : WeatherModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeathersModelToJson(WeathersModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeId,
      'time_zone': instance.timezone,
      'consolidated_weather': instance.weathers,
    };
