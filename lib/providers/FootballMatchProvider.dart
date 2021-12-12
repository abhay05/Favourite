import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/FootballMatch.dart';
import '../widgets/FootballMatchCard.dart';
import 'package:intl/intl.dart';
import '../readWriteLocal.dart';

class FootballMatchProvider with ChangeNotifier {
  // final matches = [
  //   FootballMatch(
  //     team1: "LIV",
  //     team2: "MUN",
  //     winner: "MUN",
  //     schedule: 1639594800000,
  //   ),
  //   FootballMatch(
  //     team1: "CHE",
  //     team2: "ARS",
  //     winner: "ARS",
  //     schedule: 1628881200000,
  //   ),
  //   FootballMatch(
  //     team1: "MNC",
  //     team2: "MUN",
  //     winner: "MUN",
  //     schedule: 1631559600000,
  //   ),
  //   FootballMatch(
  //     team1: "TOT",
  //     team2: "MUN",
  //     winner: "MUN",
  //     schedule: 1631559600001,
  //   ),
  //   FootballMatch(
  //     team1: "MNU",
  //     team2: "VIL",
  //     winner: "MNU",
  //     schedule: 1639508400000,
  //   ),
  //   FootballMatch(
  //     team1: "ARS",
  //     team2: "MNC",
  //     winner: "ARS",
  //     schedule: 1639422000000,
  //   ),
  // ];
  var matches=[];

  Future<List> fetchMatches() async{
    //var
    String scheduleString;
    if(await AppDataStorage.checkFile("Schedule Data")){
      print("reading from mobile");
      scheduleString=await AppDataStorage.readFile("Schedule Data");
    }else{
      print("reading from laptop");
     scheduleString= await rootBundle.loadString("lib/data/schedule.json");
     await AppDataStorage.writeToFile(scheduleString,"Schedule Data");
    }
   // print(scheduleString);
   //var currDir= Directory.current;
  // E:/Flutter/Projects/favourite/lib/
    //var file=File('../data/schedule.json');
    //String scheduleString= await file.readAsString(encoding:utf8);
    //print(scheduleString);
    print(scheduleString.length);
    var schedule = await json.decode(scheduleString);
    print("Matches "+schedule.length.toString());
    var scheduled_matches=[];
var schedules=schedule["schedules"];
    for(var i =0;i<schedules.length;i++){
      
      var comp1=schedules[i]["sport_event"]["competitors"][0];
      var competitorId1=comp1["id"];
      var competitorName1=comp1["name"];
      var competitorAbbr1=comp1["abbreviation"];

      var comp2=schedules[i]["sport_event"]["competitors"][1];
      var competitorId2=comp2["id"];
      var competitorName2=comp2["name"];
      var competitorAbbr2=comp2["abbreviation"];

      var start_time=schedules[i]["sport_event"]["start_time"];
      var time_in_millSec=DateTime.parse(start_time).millisecondsSinceEpoch;//DateFormat("YYYY-MM-DDT19:00:00+00:00");
      //DateTime().millisecondsSinceEpoch;
      var winner_id=schedules[i]["sport_event_status"]["winner_id"];
      var winner;
      if(winner_id==competitorId1){
        winner=competitorAbbr1;
      }else{
        winner=competitorAbbr2;
      }
      scheduled_matches.add(FootballMatch(team1: competitorAbbr1,team2: competitorAbbr2,winner: winner,schedule: time_in_millSec));
      

    }
    matches=scheduled_matches;
    notifyListeners();
  }

  List<FootballMatchCard> getTeamsCards() {
    // return [...matches];
    matches.sort((a,b)=>a.schedule.compareTo(b.schedule));
    List<FootballMatchCard> arr = [];
    matches.forEach((ele) {
      arr.add(FootballMatchCard(team:ele));
    });
  //  arr.sort((a,b)=>a.schedule.compareTo(b.schedule)
    return arr;
  }
}
