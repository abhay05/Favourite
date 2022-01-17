import 'package:flutter/material.dart';
//import ''
import 'package:provider/provider.dart';
import '../models/ProviderClass.dart';

class HockeyMatchProvider extends ProviderClass {
  var matchesList = [
    {
      "team1": "lal",
      "team2": "lac",
      "schedule": 1742331881000, // in milliseconds
      "game": "basketball",
    },
    {
      "team1": "gsw",
      "team2": "hou",
      "schedule": 1742331881000, // in milliseconds
      "game": "basketball",
    },
    {
      "team1": "ind",
      "team2": "lac",
      "schedule": 1742331881000, // in milliseconds
      "game": "basketball",
    },
    {
      "team1": "ind",
      "team2": "gsw",
      "schedule": 1742331881000, // in milliseconds
      "game": "basketball",
    }
  ];
  HockeyMatchProvider(this.matchesList) : super(matchesList: matchesList);
}
