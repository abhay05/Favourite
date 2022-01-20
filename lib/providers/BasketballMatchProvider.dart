import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Match.dart';
import '../widgets/MatchCard.dart';

class BasketballMatchProvider with ChangeNotifier {
  var matchesList = [
    {
      "team1": "LAL",
      "team2": "LAC",
      "schedule": 1742331881000, // in milliseconds
      "game": "basketball",
    },
    {
      "team1": "GSW",
      "team2": "HOU",
      "schedule": 1742331881000, // in milliseconds
      "game": "basketball",
    },
    {
      "team1": "IND",
      "team2": "LAC",
      "schedule": 1742331881000, // in milliseconds
      "game": "basketball",
    },
    {
      "team1": "IND",
      "team2": "GSW",
      "schedule": 1742331881000, // in milliseconds
      "game": "basketball",
    }
  ];

  Future<void> fetchMatches() async {}

  List<MatchCard> get getTeamsCards {
    List<MatchCard> matchesCards;
    matchesCards = matchesList
        .map((e) => MatchCard(
                team: Match(
              schedule: e["schedule"],
              team1: e["team1"],
              team2: e["team2"],
              game: e["game"],
            )
                //  MatchSchedule(id: e["match_id"],abbr1: e["abbr1"],abbr2:e["abbr2"], schedule: e["schedule"])
                ))
        .toList();
    return [...matchesCards];
  }
}
