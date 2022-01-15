import 'package:favourite/providers/FootballMatchStatsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

import '../widgets/CricketMatchCard.dart';
import '../models/CricketMatchStats.dart';
import '../models/FootballMatch.dart';
import '../widgets/FootballMatchCard.dart';

class CricketMatchesProvider with ChangeNotifier {
  var matchesList = [
    // {
    //   "id": "1",
    //   "innings_no": 1,
    //   "match_id": "1",
    //   "runs": 4,
    //   "sixes": 6,
    //   "run_rates": 2.5,
    //   "overs": 10
    // },
    // {
    //   "id": "2",
    //   "innings_no": 1,
    //   "match_id": "3",
    //   "runs": 4,
    //   "sixes": 6,
    //   "run_rates": 2.5,
    //   "overs": 10
    // },
    {
      "match_id": "sr:match:31432709",
      "tournament_id": "sr:tournament:2478",
      "schedule": 1642331881000,
      "season_name": "Twenty20 Big Bash League 21\/22",
      "tournament_name": "Big Bash League",
      "name1": "Perth Scorchers",
      "abbr1": "PSC",
      "name2": "Melbourne Stars",
      "abbr2": "MST",
      "game": "cricket"
    },
    {
      "match_id": "sr:match:31432709",
      "tournament_id": "sr:tournament:2478",
      "schedule": 1642331881000,
      "season_name": "Twenty20 Big Bash League 21\/22",
      "tournament_name": "Big Bash League",
      "name1": "Perth Scorchers",
      "abbr1": "PSC",
      "name2": "Melbourne Stars",
      "abbr2": "MST",
      "game": "cricket"
    },
    {
      "match_id": "sr:match:31432709",
      "tournament_id": "sr:tournament:2478",
      "schedule": 1642331881000,
      "season_name": "Twenty20 Big Bash League 21\/22",
      "tournament_name": "Big Bash League",
      "name1": "Perth Scorchers",
      "abbr1": "PSC",
      "name2": "Melbourne Stars",
      "abbr2": "MST",
      "game": "cricket"
    },
  ];
  Future<void> fetchMatches() async {
    //var url=Uri.http('https://google.com');
    //var http.get(url);
    //notifyListeners();
    // return Future<List>.value(matchesList);
  }

  List<FootballMatchCard> get getTeamsCards {
    List<FootballMatchCard> matchesCards;
    matchesCards = matchesList
        .map((e) => FootballMatchCard(
                team: FootballMatch(
              schedule: e["schedule"],
              team1: e["abbr1"],
              team2: e["abbr2"],
              game: e["game"],
            )
                //  MatchSchedule(id: e["match_id"],abbr1: e["abbr1"],abbr2:e["abbr2"], schedule: e["schedule"])
                ))
        .toList();
    return [...matchesCards];
  }
}
