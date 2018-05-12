import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_places_autocomplete/flutter_google_places_autocomplete.dart';

import 'main.dart';
import 'addTodo.dart';

const kGoogleApiKey = "AIzaSyDEtGrV-U7k4_LY52k-u9ScyQeEIvR5f7k";

GoogleMapsPlaces _places = new GoogleMapsPlaces(kGoogleApiKey);

final searchScaffoldKey = new GlobalKey<ScaffoldState>();


Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
  if (p != null) {
    // get detail (lat/lng)
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
    final lat = detail.result.geometry.location.lat;
    final lng = detail.result.geometry.location.lng;
    scaffold.showSnackBar(
        new SnackBar(content: new Text("${p.description} - $lat/$lng"))
    );
  }
}

//void getLocation(){
//  print('return');
//}


// custom scaffold that handle search
// basically your widget need to extends [GooglePlacesAutocompleteWidget]
// and your state [GooglePlacesAutocompleteState]
class CustomSearchScaffold extends GooglePlacesAutocompleteWidget {
  CustomSearchScaffold()
      : super(
            apiKey: kGoogleApiKey,
            language: "en",
          );

  @override
  _CustomSearchScaffoldState createState() => new _CustomSearchScaffoldState();
}

class _CustomSearchScaffoldState extends GooglePlacesAutocompleteState {
  @override
  Widget build(BuildContext context) {
    final appBar = new AppBar(
      title: new AppBarPlacesAutoCompleteTextField(),
      backgroundColor: Colors.redAccent[400],
    );
    final body = new GooglePlacesAutocompleteResult(onTap: (p) {
      displayPrediction(p, searchScaffoldKey.currentState);
      String loc =  p.description;

      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new AddTodo(loc)),
        //TODO: send selected location data to addTodo

      );
    });
    return new Scaffold(key: searchScaffoldKey, appBar: appBar, body: body);
  }

  @override
  void onResponseError(PlacesAutocompleteResponse response) {
    super.onResponseError(response);
    searchScaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(response.errorMessage)));
  }

  @override
  void onResponse(PlacesAutocompleteResponse response) {
    super.onResponse(response);
    if (response != null && response.predictions.isNotEmpty) {
      searchScaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("Got answer")));
    }
  }
}
