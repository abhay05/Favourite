import 'package:favourite/providers/FootballMatchStatsProvider.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../models/FootballMatchStats.dart';

class MatchStats extends StatefulWidget {
  static const route = "/match_stats";
  final team1;
  final team2;
  final startTime;
  MatchStats(this.team1, this.team2, this.startTime);

  @override
  _MatchStatsState createState() => _MatchStatsState();
}

class _MatchStatsState extends State<MatchStats> {
  Future<void> _loadStats(BuildContext ctx, String team1, String team2) async {
    await Provider.of<MatchStatsProvider>(ctx, listen: false)
        .fetchStats(team1, team2, widget.startTime);
  }

  Future<FootballMatchStats> _statsFuture;

  var stat_attributes = [
    "ball_possession",
    "shots_total",
    "shots_on_target",
    "corner_kicks",
    "free_kicks",
    "offsides",
    "fouls",
    "red_cards",
    "yellow_cards"
  ];

  var stat_attributes_names = {
    "ball_possession": "Possession",
    "shots_total": "Total Shots",
    "shots_on_target": "Shots on Target",
    "corner_kicks": "Corner Kicks",
    "free_kicks": "Free Kicks",
    "offsides": "Offsides",
    "fouls": "Fouls",
    "red_cards": "Red Cards",
    "yellow_cards": "Yellow Cards"
  };

  Widget getStatRow(int home, String attribute, int away) {
    return Expanded(
      child: Row(
        children: [
          Expanded(child: Center(child: Text(home.toString()))),
          Expanded(
              child: Center(child: Text(stat_attributes_names[attribute]))),
          Expanded(child: Center(child: Text(away.toString()))),
        ],
      ),
    );
  }

  List getStats(TeamStats home_team_stat, TeamStats away_team_stat) {
    var statRows = [];
    stat_attributes.forEach(
      (element) {
        statRows.add(
          getStatRow(
            home_team_stat.getStatsMap()[element],
            element,
            away_team_stat.getStatsMap()[element],
          ),
        );
      },
    );
    return statRows;
  }

  @override
  void initState() {
    // print("Team 1 "+widget.team1);
    // print("Team 2 "+widget.team2);
    print("Match Stats " +
        widget.team1.toString() +
        " " +
        widget.team2.toString());
    _statsFuture = Provider.of<MatchStatsProvider>(context, listen: false)
        .fetchStats(widget.team1, widget.team2, widget.startTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Build " + widget.team1.toString() + " " + widget.team2.toString());

    // var teams=ModalRoute.of(context).settings.arguments as Map<dynamic,dynamic>;
    // _loadStats(context,teams["team1"],teams["team2"]);
    // getStats();
    var statsProvider = Provider.of<MatchStatsProvider>(context);
    var matchStats = FootballMatchStats();

    matchStats = statsProvider.getStats();
    //var matchStats=statsProvider.getStats();

    //return Scaffold(body: Center(child: Text(statsProvider.getStats().winner)));
    //var home_team_stat=matchStats.home_team_stats;
    //var away_team_stat=matchStats.away_team_stats;
    //getStats(matchStats.home_team_stats,matchStats.away_team_stats);
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder(
      future: _statsFuture,
      builder: (ctx, dataSnapshot) {
        Widget widget;
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          widget = Center(child: CircularProgressIndicator());
        } else if (dataSnapshot.connectionState == ConnectionState.done) {
          if (dataSnapshot.error != null) {
            widget = Center(child: Text(dataSnapshot.error.toString()));
          } else {
            widget = Consumer<MatchStatsProvider>(
              builder: (ctx, provider, child) {
                matchStats = provider.getStats();
                //  var statRows=getStats(matchStats.home_team_stats, matchStats.away_team_stats);
                widget = Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top +
                              height * 0.05),
                      height: height * 0.2 - 19,
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.1,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                      child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: Text(
                                          matchStats.home_team_goals == null
                                              ? "0"
                                              : matchStats.home_team_goals
                                                  .toString(),
                                          style: TextStyle(
                                            fontSize: 30,
                                            //color: matchStats.home_team==matchStats.winner?Colors.green:Colors.black
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        color: matchStats.home_team ==
                                                matchStats.winner
                                            ? Colors.green
                                            : Colors.white,
                                        child: Text(
                                          matchStats.home_team == null
                                              ? "Def"
                                              : matchStats.home_team,
                                          style: TextStyle(
                                            fontSize: 10,
                                            //color: matchStats.home_team==matchStats.winner?Colors.green:Colors.black
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      " - ",
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Container(
                                          // color: Colors.pink,
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10, right: 10),
                                          child: Text(
                                            matchStats.away_team_goals == null
                                                ? "0"
                                                : matchStats.away_team_goals
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 30,
                                              //color: matchStats.home_team==matchStats.winner?Colors.green:Colors.black
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // color:Colors.red,
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10, right: 10),
                                          color: matchStats.away_team ==
                                                  matchStats.winner
                                              ? Colors.blue
                                              : Colors.white,
                                          child: Text(
                                            matchStats.away_team == null
                                                ? "Def"
                                                : matchStats.away_team,
                                            style: TextStyle(
                                              fontSize: 10,
                                              //  backgroundColor: Colors.green,
                                              // color: matchStats.home_team==matchStats.winner?Colors.blue:Colors.black
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.black,
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    // style: ,
                                    onPressed: () {},
                                    child: Text("Lineup")),
                                TextButton(
                                    onPressed: () {}, child: Text("Stats")),
                                TextButton(
                                    onPressed: () {}, child: Text("Comments")),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: width * 0.9,
                        height: height * 0.7,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          //border: Border.all(color: Colors.grey[600],width: 2),
                          // color:Colors.grey[400],
                          boxShadow: [
                            BoxShadow(color: Colors.grey[400]),
                            BoxShadow(
                              color: Colors.grey[300],
                              spreadRadius: -6.0,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        //color: Colors.grey[400],
                        child: Column(
                          children: [
                            ...getStats(matchStats.home_team_stats,
                                matchStats.away_team_stats),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
                return widget;
              },
            );
          }
        }
        return widget;
      },
    ));
  }
}
