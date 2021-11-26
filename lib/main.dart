import 'package:favourite/providers/FootballMatchProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './favouriteApp.dart';
import './MaterialColor.dart';
import './screens/Match_Stats.dart';
import './providers/FootballMatchStatsProvider.dart';

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
        ],
        // red -> 0xd60606
        child: MaterialApp(
          theme: ThemeData(
            //primaryColor: Color(0xdee2e0),-> grey
            primarySwatch: generateMaterialColor(
              Color(0xd60606).withAlpha(0xFF),
            ),
            accentColor: Color(0xc1c0bf).withAlpha(0xFF),
            //0xcecdcc-> fine
            //MaterialColor(0xdee2e0, {1:Colors.red}),
          ),
          home: FavouriteApp(),
          routes: {
            //MatchStats.route: (ctx) => MatchStats(),
          },
        ));
  }
}
