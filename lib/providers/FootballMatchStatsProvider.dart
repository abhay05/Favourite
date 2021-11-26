import "dart:convert";

import 'package:favourite/readWriteLocal.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

import "../models/FootballMatchStats.dart";

class MatchStatsProvider with ChangeNotifier {
 // var resp;
  FootballMatchStats matchStatsToday = FootballMatchStats(
    winner: "Me",
    away_team: "None",
    away_team_goals: 0,
    away_team_stats: TeamStats(),
    home_team: "None",
    home_team_goals: 0,
    home_team_stats: TeamStats(),
  );
  TeamStats initializeTeamStats(Map<String,dynamic>resp,String team) {
    return TeamStats(
      ball_possession: resp[team]["ball_possession"],
      card_given: resp[team]["card_given"],
      corner_kicks: resp[team]["corner_kicks"],
      fouls: resp[team]["fouls"],
      free_kicks: resp[team]["free_kicks"],
      goal_kicks: resp[team]["goal_kicks"],
      injuries: resp[team]["injuries"],
      offsides: resp[team]["offsides"],
      red_cards: resp[team]["red_cards"],
      shots_blocked: resp[team]["shots_blocked"],
      shots_off_target: resp[team]["shots_off_target"],
      shots_on_target: resp[team]["shots_on_target"],
      shots_saved: resp[team]["shots_saved"],
      shots_total: resp[team]["shots_total"],
      substitutions: resp[team]["substitutions"],
      throw_ins: resp[team]["throw_ins"],
      yellow_cards: resp[team]["yellow_cards"],
      yellow_red_cards: resp[team]["yellow_red_cards"],
    );
  }

  var respString = -1;
  Future<FootballMatchStats> fetchStats(String team1,String team2,int startTime) async {
    var response;
    var respData;
   // print('192.168.1.8:8085'+ "/match_stats/${team1.toLowerCase()}-${team2.toLowerCase()}");
    //http://localhost:8085/match_stats/ars-mnc
    try {
      if(await AppDataStorage.checkFile(team1+team2+startTime.toString())){
        response=await AppDataStorage.readFile(team1+team2+startTime.toString());
        respData=json.decode(response) as Map<dynamic, dynamic>;
        print(respData);
        print(respData.runtimeType);
        print("reading from mobile");
      }else{
      var url = Uri.http("192.168.1.2:8085", "/match_stats/${team1.toLowerCase()}-${team2.toLowerCase()}");
     // print(url.port);
     //var url=Uri.http("192.168.1.8:8085","/match_stats/ars-mnc");
     print("reading from local");
      response = await http.get(url);
      print(response.toString());
     //var respData={"Kick Off":"28 Aug 2021","winner":"Manchester City","home":"Manchester City","away":"Arsenal FC","home_team_goals":5,"away_team_goals":0,"home_team_stats":{"ball_possession":81,"cards_given":1,"corner_kicks":14,"fouls":5,"free_kicks":10,"goal_kicks":4,"injuries":0,"offsides":1,"red_cards":0,"shots_blocked":8,"shots_off_target":3,"shots_on_target":11,"shots_saved":0,"shots_total":22,"substitutions":3,"throw_ins":21,"yellow_cards":1,"yellow_red_cards":0},"away_team_stats":{"ball_possession":19,"cards_given":3,"corner_kicks":0,"fouls":7,"free_kicks":6,"goal_kicks":11,"injuries":2,"offsides":3,"red_cards":1,"shots_blocked":0,"shots_off_target":1,"shots_on_target":0,"shots_saved":6,"shots_total":1,"substitutions":3,"throw_ins":12,"yellow_cards":2,"yellow_red_cards":0}};
      //var respData = Map<String, dynamic>.from(reponse);
       respData=json.decode(response.body) as Map<dynamic, dynamic>;
      if(await AppDataStorage.writeToFile(response.body, team1+team2+startTime.toString())){
        print("written $team1 $team2 $startTime to memory");
      }else{
        print("Writing in memory failed");
      }
      }
    //  print("home_team_possession");
     // var home_team_possession = respData["home_team_stats"]["ball_possession"];
     // print("home_team_possession");
     // print(home_team_possession);
      //print("Resp Data "+respData);
      var home_team_stats = initializeTeamStats(respData,"home_team_stats");
      var away_team_stats = initializeTeamStats(respData,"away_team_stats");
      var kick_off = respData["Kick Off"].toString();
      var winner = respData["winner"].toString();
      var home = respData["home"].toString();
      var away = respData["away"].toString();
      var home_team_goals = respData["home_team_goals"].toString();
      var away_team_goals = respData["away_team_goals"].toString();
      print("home");
      print(home);

      matchStatsToday = FootballMatchStats(
        kick_off: kick_off,
        home_team_stats: home_team_stats,
        away_team_stats: away_team_stats,
        winner: winner,
        home_team: home,
        home_team_goals: home_team_goals,
        away_team: away,
        away_team_goals: away_team_goals,
      );
      print(matchStatsToday.kick_off);

      //var home_team_cards_given
      //TeamStats home_team_stats = TeamStats(...resp["home_team_stats"]);
    } catch (e) {
      print(e);
    }
    notifyListeners();
   // return matchStatsToday;
  }

  FootballMatchStats getStats() {
    //FootballMatchStats matchStatsTodayTemp=matchStatsToday; //create a deep copy method
    return matchStatsToday;
  }
}
