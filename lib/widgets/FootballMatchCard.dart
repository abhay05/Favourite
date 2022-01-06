import 'package:flutter/material.dart';
import '../models/FootballMatch.dart';
import 'package:intl/intl.dart';
import '../screens/Match_Stats.dart';
import '../globals.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FootballMatchCard extends StatefulWidget {
  final FootballMatch team;
  FootballMatchCard({Key key, this.team}) : super(key: key);
  FootballMatch get getTeam {
    return this.team;
  }

  @override
  FootballMatchCardState createState() => FootballMatchCardState();
}

class FootballMatchCardState extends State<FootballMatchCard> {
  GlobalKey<FootballMatchCardState> globalKey = Globals.get();

  Widget tryCatch(String imageUri) {
    var ret = imageUri;
    try {
      SvgPicture.asset(imageUri);
    } catch (e) {
      print("excp");
      ret = "assets/images/prem.svg";
    }
    print(ret);
    return SvgPicture.asset(
      ret,
      placeholderBuilder: (ctx) => SvgPicture.asset(
        "assets/images/prem.svg",
        fit: BoxFit.cover,
      ),
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return InkWell(
      // key: globalKey,
      onTap: () {
        // Navigator.of(context).pushNamed( MatchStats.route,arguments:{"team1":team.team1,"team2":team.team2});
        print("Teams " + widget.team.team1 + " " + widget.team.team2);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MatchStats(
                widget.team.team1, widget.team.team2, widget.team.schedule)));
      },
      child: Card(
        //color: Colors.red,

        elevation: 0,
        clipBehavior: Clip.hardEdge,
        //clipBehavior: ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Container(
          height: mediaQuery.size.height / 6,
          width: (mediaQuery.size.width - 20) / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                5,
              ),
            ),
            border: Border.all(
              color: Colors.grey,
            ),
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 5,
            //     offset: Offset.fromDirection(30),
            //     spreadRadius: 5,
            //     color: Colors.grey,
            //   ),
            // ],
          ),
          child: Stack(
            children: [
              Container(
                height: 60,
                width: (mediaQuery.size.width - 20) / 3,
                //padding: EdgeInsets.only(left: 2),
                child: //Text("jel"),

                    Row(
                  children: [
                    tryCatch(
                      "assets/images/${widget.team.team1.toString().toLowerCase()}.svg",
                    ),
                    Text(" VS "),
                    tryCatch(
                      "assets/images/${widget.team.team2.toString().toLowerCase()}.svg",
                    ),
                  ],
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
                top: 65,
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
                          fontSize: 15,
                          fontFamily: 'OpenSans',
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
