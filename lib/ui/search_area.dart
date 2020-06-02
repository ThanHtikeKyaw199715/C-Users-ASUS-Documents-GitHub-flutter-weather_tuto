import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_tuto/bloc/search/bloc.dart';
import 'package:weather_tuto/ui/weather_home.dart';

class SearchArea extends StatefulWidget {
  @override
  _SearchAreaState createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  final TextEditingController _searchCity = TextEditingController();

  @override
  void dispose() {
    _searchCity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // ignore: close_sinks
    final searchBloc = BlocProvider.of<SearchBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Weather"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    controller: _searchCity,
                    decoration: InputDecoration(
                        labelText: "Search City", border: OutlineInputBorder()
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.blue,
                  onPressed: () {
                    if(_searchCity.text != "") {
                      searchBloc..add(FetchCity(cityName: _searchCity.text));
                    }
                  },
                  tooltip: "Search",
                )
              ],
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {

                  if(state is CityEmptyState) {
                    return Center(
                      child: Text("Type something to search"),
                    );
                  }

                  if(state is CityLoadingState) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is CityErrorState){
                    return Center(
                      child: Text(state.error),
                    );
                  }
                  if(state is CityLoadedState) {
                    return ListView.builder(
                        itemCount: state.cityModels.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                  WeatherHome(cityCode: state.cityModels[index].woeId)
                              )
                              );
                            },
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0, bottom: 15.0),
                                child: Text(
                                  "${state.cityModels[index].title}",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        textStyle: Theme.of(context).textTheme.headline6
                                    )
                                ),
                              ),
                            ),
                          );
                        });
                  }
                  return Center(
                    child: Text("Null"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}