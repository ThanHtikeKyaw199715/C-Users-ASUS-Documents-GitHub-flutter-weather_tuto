import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class FetchCity extends SearchEvent {

  final String cityName;

  const FetchCity({@required this.cityName}): assert(cityName != null);


  @override
  // TODO: implement props
  List<Object> get props => [cityName];

}