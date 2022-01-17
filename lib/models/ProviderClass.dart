import './Match.dart';
import '../widgets/MatchCard.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProviderClass with ChangeNotifier {
  var matchesList = [];
  ProviderClass({this.matchesList});
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
