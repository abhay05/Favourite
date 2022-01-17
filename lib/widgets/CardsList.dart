import 'package:favourite/providers/BasketballMatchProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './MatchCard.dart';
import '../providers/FootballMatchProvider.dart';
import '../providers/CricketMatchesProvider.dart';

class CardsList extends StatelessWidget {
  var matchesList;
  var _scrollController;
  var game = "football";

  CardsList(this.matchesList, this._scrollController, this.game);
  Widget build(BuildContext context) {
    print("GAME " + this.game);
    var mediaQuery = MediaQuery.of(context);
    return FutureBuilder(
      future: matchesList,
      builder: (ctx, httpSnapshot) {
        var widget;
        print(this.game + " " + httpSnapshot.connectionState.toString());
        if (httpSnapshot.connectionState == ConnectionState.waiting) {
          widget = CircularProgressIndicator();
        } else if (httpSnapshot.connectionState == ConnectionState.done) {
          if (httpSnapshot.error != null) {
            widget = Text(httpSnapshot.error.toString());
          } else {
            var teams;

            widget = game == "cricket"
                ? Consumer<CricketMatchesProvider>(
                    builder: (ctx, provider, child) {
                    teams = provider.getTeamsCards;
                    int nowTime = DateTime.now().millisecondsSinceEpoch;
                    int scrollOffset = 0;
                    for (var i = 0; i < teams.length; i++) {
                      if (teams[i].getTeam.schedule > nowTime) {
                        scrollOffset = i;
                        break;
                      }
                    }
                    print("now " +
                        nowTime.toString() +
                        " " +
                        teams[scrollOffset].getTeam.schedule.toString() +
                        " " +
                        scrollOffset.toString());
                    print(DateTime.fromMillisecondsSinceEpoch(
                        teams[scrollOffset].getTeam.schedule));
                    var widWidth = (mediaQuery.size.width - 20) / 3;
                    print(widWidth);
                    var nwidgets = scrollOffset + 1;
                    var qwidgets = nwidgets ~/ 3;
                    var rwidgets = nwidgets % 3;
                    _scrollController = ScrollController(
                        initialScrollOffset: qwidgets * mediaQuery.size.width +
                            rwidgets * (widWidth + 10));
                    widget = SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      child: Row(
                        children: teams,
                      ),
                    );
                    return widget;
                  })
                : game == "basketball"
                    ? Consumer<BasketballMatchProvider>(
                        builder: (ctx, provider, child) {
                        teams = provider.getTeamsCards;
                        int nowTime = DateTime.now().millisecondsSinceEpoch;
                        int scrollOffset = 0;
                        for (var i = 0; i < teams.length; i++) {
                          if (teams[i].getTeam.schedule > nowTime) {
                            scrollOffset = i;
                            break;
                          }
                        }
                        print("now " +
                            nowTime.toString() +
                            " " +
                            teams[scrollOffset].getTeam.schedule.toString() +
                            " " +
                            scrollOffset.toString());
                        print(DateTime.fromMillisecondsSinceEpoch(
                            teams[scrollOffset].getTeam.schedule));
                        var widWidth = (mediaQuery.size.width - 20) / 3;
                        print(widWidth);
                        var nwidgets = scrollOffset + 1;
                        var qwidgets = nwidgets ~/ 3;
                        var rwidgets = nwidgets % 3;
                        _scrollController = ScrollController(
                            initialScrollOffset:
                                qwidgets * mediaQuery.size.width +
                                    rwidgets * (widWidth + 10));
                        widget = SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          child: Row(
                            children: teams,
                          ),
                        );
                        return widget;
                      })
                    : Consumer<FootballMatchProvider>(
                        builder: (ctx, provider, child) {
                        teams = provider.getTeamsCards();
                        int nowTime = DateTime.now().millisecondsSinceEpoch;
                        int scrollOffset = 0;
                        for (var i = 0; i < teams.length; i++) {
                          if (teams[i].getTeam.schedule > nowTime) {
                            scrollOffset = i;
                            break;
                          }
                        }
                        print("now " +
                            nowTime.toString() +
                            " " +
                            teams[scrollOffset].getTeam.schedule.toString() +
                            " " +
                            scrollOffset.toString());
                        print(DateTime.fromMillisecondsSinceEpoch(
                            teams[scrollOffset].getTeam.schedule));
                        var widWidth = (mediaQuery.size.width - 20) / 3;
                        print(widWidth);
                        var nwidgets = scrollOffset + 1;
                        var qwidgets = nwidgets ~/ 3;
                        var rwidgets = nwidgets % 3;
                        _scrollController = ScrollController(
                            initialScrollOffset:
                                qwidgets * mediaQuery.size.width +
                                    rwidgets * (widWidth + 10));
                        widget = SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          child: Row(
                            children: teams,
                          ),
                        );
                        return widget;
                      });
          }
        } else {
          var teams;
          widget =
              Consumer<CricketMatchesProvider>(builder: (ctx, provider, child) {
            teams = provider.getTeamsCards;
            int nowTime = DateTime.now().millisecondsSinceEpoch;
            int scrollOffset = 0;
            for (var i = 0; i < teams.length; i++) {
              if (teams[i].getTeam.schedule > nowTime) {
                scrollOffset = i;
                break;
              }
            }
            print("now " +
                nowTime.toString() +
                " " +
                teams[scrollOffset].getTeam.schedule.toString() +
                " " +
                scrollOffset.toString());
            print(DateTime.fromMillisecondsSinceEpoch(
                teams[scrollOffset].getTeam.schedule));
            var widWidth = (mediaQuery.size.width - 20) / 3;
            print(widWidth);
            var nwidgets = scrollOffset + 1;
            var qwidgets = nwidgets ~/ 3;
            var rwidgets = nwidgets % 3;
            _scrollController = ScrollController(
                initialScrollOffset: qwidgets * mediaQuery.size.width +
                    rwidgets * (widWidth + 10));
            widget = SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Row(
                children: teams,
              ),
            );
            return widget;
          });
        }
        return widget;
      },
    );
  }
}
