import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_tuto/network/api_service.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiService api;

  SearchBloc({@required this.api}): assert(api != null);

  @override
  SearchState get initialState => CityEmptyState();

  @override
  Stream<SearchState> mapEventToState(
      SearchEvent event,
      ) async* {
    if(event is FetchCity) {
      yield CityLoadingState();
      try {
        final response = await api.getCities(event.cityName);
        yield CityLoadedState(cityModels: response);

      } on SocketException catch (e) {
        yield CityErrorState(e.toString());
      } on Exception catch (e) {
        yield CityErrorState(e.toString());
      }
    }
  }
}