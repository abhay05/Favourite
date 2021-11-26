import 'package:flutter/material.dart';
import '../models/FootballMatch.dart';
import 'package:intl/intl.dart';
import '../screens/Match_Stats.dart';
import '../globals.dart';

class FootballMatchCard extends StatefulWidget {
  final FootballMatch team;
  FootballMatchCard({Key key,this.team}):super(key: key);
  FootballMatch get getTeam{
    return this.team;
  }

  @override
  FootballMatchCardState createState() => FootballMatchCardState();
}

class FootballMatchCardState extends State<FootballMatchCard> {
  
  GlobalKey<FootballMatchCardState>globalKey=Globals.get();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return InkWell(
     // key: globalKey,
      onTap: () {
       // Navigator.of(context).pushNamed( MatchStats.route,arguments:{"team1":team.team1,"team2":team.team2});
       print("Teams "+widget.team.team1+" "+widget.team.team2);
       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MatchStats(widget.team.team1,widget.team.team2,widget.team.schedule)));
      },
      child: Card(
        //color: Colors.red,

        elevation: 5,
        clipBehavior: Clip.hardEdge,
        //clipBehavior: ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Container(
          width: (mediaQuery.size.width - 20) / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                5,
              ),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 60,
                width: (mediaQuery.size.width - 20) / 3,
                child: //Text("jel"),
                Image.asset(
                  "assets/images/${widget.team.team1.toString().toLowerCase()}Vs${widget.team.team2.toString().toLowerCase()}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20),
              //     topRight: Radius.circular(20),
              //   ),
              //   child: Container(
              //     //color: Colors.red,
              //     //decoration: BoxDecoration(border),
              //     height: 40,
              //     child: Image.asset(
              //       "assets/images/${team.team1.toString().toLowerCase()}Vs${team.team2.toString().toLowerCase()}.jpg",
              //     ),
              //   ),
              // ),
              Positioned(
                top: 30,
                left: 25,
                child: Opacity(
                  opacity: .8,
                  child: Container(
                    //padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.color,
                      color: Colors.grey,
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        text:
                            "        ${widget.team.team1} - ${widget.team.team2} \n ${DateFormat.yMMMEd().format(DateTime.fromMillisecondsSinceEpoch(widget.team.schedule))}",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //shadowColor: ,
      ),
    );
  }
}
