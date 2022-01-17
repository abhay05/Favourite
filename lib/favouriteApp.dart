import 'package:favourite/providers/BasketballMatchProvider.dart';
import 'package:favourite/providers/FootballMatchProvider.dart';
import 'package:favourite/widgets/CardsList.dart';
import 'package:favourite/widgets/MatchCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import './globals.dart';
import './Theme.dart';
import './providers/CricketMatchesProvider.dart';

class FavouriteApp extends StatefulWidget {
  @override
  _FavouriteAppState createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  ScrollController _scrollController;
  Future<List> matchesList;
  Future<void> cricketMatchesList;
  Future<void> basketballMatchesList;

  void initState() {
    var matchesProvider =
        Provider.of<FootballMatchProvider>(context, listen: false);
    // we can use context in initState , because listen is false
    matchesList = matchesProvider.fetchMatches();
    var cricketMatchesProvider =
        Provider.of<CricketMatchesProvider>(context, listen: false);
    cricketMatchesList = cricketMatchesProvider.fetchMatches();
    var basketballMatchProvider =
        Provider.of<BasketballMatchProvider>(context, listen: false);
    basketballMatchesList = basketballMatchProvider.fetchMatches();
    super.initState();
  }

  void postFrameCallback() {
    //  GlobalKey<FootballMatchCardState> FootballMatchGlobalKey = Globals.get();
    // var widWidth=FootballMatchGlobalKey.currentContext.size.width;
    //print("Widget width "+widWidth.toString());
    //_scrollController.jumpTo(1); -> this won't work as we are using single
    //global for all the cards , so only one card is rendered instead of list of cards
    //but we can still get width of single card using this technique
    //We can also create a list of global keys for each card but that would be cumbersome
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   postFrameCallback();
    // });
    var matchesProvider = Provider.of<FootballMatchProvider>(context);
    var cricketMatchesProvider = Provider.of<CricketMatchesProvider>(context);
    var basketballMatchProvider =
        Provider.of<BasketballMatchProvider>(context, listen: false);
    var teams = matchesProvider.getTeamsCards();
    var cricketMatches = cricketMatchesProvider.getTeamsCards;
    // var basketBallMatches=
    return Scaffold(
      appBar: AppBar(
        //title: Text("Favourite"),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.star,
                size: 30,
                color: MapTheme.miscellaneousIcons["favouriteIconTheme"],
              )),
          // FlatButton(
          //   onPressed: () {},
          //   child: Text("Press to add Favourites"),
          // ),
        ],
      ),
      // backgroundColor: Colors.white, //Theme.of(context).white,
      body: SingleChildScrollView(
          child: Column(children: [
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                left: 5,
                top: 10,
              ),
              child: Text(
                "Premier League",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decorationThickness: 22,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),

            CardsList(matchesList, _scrollController, "football"),
            SizedBox(
              height: 30,
            ),
            CardsList(cricketMatchesList, _scrollController, "cricket"),
            SizedBox(
              height: 30,
            ),
            CardsList(basketballMatchesList, _scrollController, "basketball"),
            // FutureBuilder(
            //   future: cricketMatchesList,
            //   builder: (context, snapshot) {
            //     Widget widget;
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       print("Snapshot " + snapshot.connectionState.toString());
            //       if (snapshot.error != null) {
            //         widget = Text(snapshot.error.toString());
            //       } else {
            //         widget = SingleChildScrollView(
            //           scrollDirection: Axis.horizontal,
            //           child: Row(
            //             children: cricketMatchesProvider.getTeamsCards,
            //           ),
            //         );
            //       }
            //     } else // if
            //     // (snapshot.connectionState ==
            //     //     ConnectionState.waiting)
            //     {
            //       widget = CircularProgressIndicator();
            //     }
            //     return widget;
            //   },
            // ),
          ],
        ),
      ])),
    );
  }
}
