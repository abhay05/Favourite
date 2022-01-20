import 'package:flutter/material.dart';
//import ''
import 'package:provider/provider.dart';
import '../models/ProviderClass.dart';

class HockeyMatchProvider with ChangeNotifier, ProviderClass {
  var matchesList = [
    {
      "team1": "TOR",
      "team2": "WPG",
      "schedule": 1742331881000, // in milliseconds
      "game": "hockey",
    },
    {
      "team1": "WSH",
      "team2": "VAN",
      "schedule": 1742331881000, // in milliseconds
      "game": "hockey",
    },
    {
      "team1": "ANA",
      "team2": "BOS",
      "schedule": 1742331881000, // in milliseconds
      "game": "hockey",
    },
    {
      "team1": "WSH",
      "team2": "VAN",
      "schedule": 1742331881000, // in milliseconds
      "game": "hockey",
    }
  ];
  //HockeyMatchProvider(this.matchesList) : super(matchesList: matchesList);
}
