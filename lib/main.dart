import 'package:favourite/providers/CricketMatchesProvider.dart';
import 'package:favourite/providers/FootballMatchProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './favouriteApp.dart';
import './MaterialColor.dart';
import './screens/Match_Stats.dart';
import './providers/FootballMatchStatsProvider.dart';
import './Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext ctx) {
              return FootballMatchProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (BuildContext ctx) {
              return MatchStatsProvider();
            },
          ),
          ChangeNotifierProvider(create: (BuildContext ctx) {
            return CricketMatchesProvider();
          }),
        ],
        // red -> 0xd60606
        child: MaterialApp(
          theme: MapTheme.light(),
          home: FavouriteApp(),
          routes: {
            //MatchStats.route: (ctx) => MatchStats(),
          },
        ));
  }
}
