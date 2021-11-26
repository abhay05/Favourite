import 'package:favourite/providers/FootballMatchProvider.dart';
import 'package:favourite/widgets/FootballMatchCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import './globals.dart';


class FavouriteApp extends StatefulWidget {
  @override
  _FavouriteAppState createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
ScrollController _scrollController;
Future<List>matchesList;

void initState(){
  var matchesProvider = Provider.of<FootballMatchProvider>(context,listen:false);
  matchesList=matchesProvider.fetchMatches();
  super.initState();
}

  void postFrameCallback(){
GlobalKey<FootballMatchCardState>FootballMatchGlobalKey=Globals.get();
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
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {postFrameCallback();});
    var matchesProvider = Provider.of<FootballMatchProvider>(context);
    var teams = matchesProvider.getTeamsCards();
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text("Press to add Favourites"),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).accentColor,
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
            FutureBuilder(future:matchesList,builder: (ctx,httpSnapshot){
              var widget;
              if(httpSnapshot.connectionState==ConnectionState.waiting){
                widget=CircularProgressIndicator();
              }else if(httpSnapshot.connectionState==ConnectionState.done){
                if(httpSnapshot.error!=null){
                  widget=Text(httpSnapshot.error.toString());
                }else{
                  var teams;
                  
                 widget= Consumer<FootballMatchProvider>(builder: (ctx,provider,child){
                    teams=provider.getTeamsCards();
                    int nowTime=DateTime.now().millisecondsSinceEpoch;
    int scrollOffset=0;
    for(var i=0;i<teams.length;i++){
      if(teams[i].getTeam.schedule>nowTime){scrollOffset=i;break;}
    }
    print("now "+nowTime.toString() +" "+teams[scrollOffset].getTeam.schedule.toString()+" "+scrollOffset.toString());
    print(DateTime.fromMillisecondsSinceEpoch(teams[scrollOffset].getTeam.schedule));
    var widWidth=(mediaQuery.size.width - 20) / 3;
    print(widWidth);
    var nwidgets=scrollOffset+1;
    var qwidgets=nwidgets~/3;
    var rwidgets=nwidgets%3;
    _scrollController = ScrollController(initialScrollOffset: qwidgets*mediaQuery.size.width+rwidgets*(widWidth+10));
                    widget=SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Row(
                children: teams,
              ),
              );
              return widget;
                  });
                  
                }
              }
              return widget;
            }),
            


            
          ],
        ),
      ])),
    );
  }
}
