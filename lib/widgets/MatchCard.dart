import 'package:flutter/material.dart';
import '../models/Match.dart';
import 'package:intl/intl.dart';
import '../screens/Match_Stats.dart';
import '../globals.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MatchCard extends StatefulWidget {
  final Match team;
  MatchCard({Key key, this.team}) : super(key: key);
  Match get getTeam {
    return this.team;
  }

  @override
  MatchCardState createState() => MatchCardState();
}

class MatchCardState extends State<MatchCard> {
  // GlobalKey<MatchCardState> globalKey = Globals.get();

  Widget tryCatch(String imageUri) {
    print("inside try catch");
    print(widget.team.game);
    print(widget.team.team1);
    var ret = imageUri;
    if (widget.team.game == "cricket" || widget.team.game == "basketball") {
      print("CRICKET");
      return ClipRRect(
        child: Image(
          image: AssetImage(imageUri + ".png"),
          fit: BoxFit.contain,
          height: 45,
          width: 45,
        ),
      );
    } else {
      try {
        SvgPicture.asset(imageUri + ".svg");
      } catch (e) {
        print("excp");
        ret = "assets/images/prem.svg";
      }
      print(ret);
      return SvgPicture.asset(
        ret + ".svg",
        placeholderBuilder: (ctx) => SvgPicture.asset(
          "assets/images/prem.svg",
          fit: BoxFit.cover,
        ),
        fit: BoxFit.cover,
      );
    }
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
            // border: Border.all(
            //      color: Colors.grey,
            //     ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tryCatch(
                      "assets/images/${widget.team.team1.toString().toLowerCase()}",
                    ),
                    Text(" VS "),
                    tryCatch(
                      "assets/images/${widget.team.team2.toString().toLowerCase()}",
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
                // left: 10,
                child: Opacity(
                  opacity: .8,
                  child: Container(
                    width: (mediaQuery.size.width - 20) / 3,
                    //padding: EdgeInsets.all(20),
                    // decoration: BoxDecoration(
                    //   backgroundBlendMode: BlendMode.color,
                    //    color: Colors.grey,
                    // ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.team.team1} - ${widget.team.team2}",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${DateFormat.yMMMEd().format(DateTime.fromMillisecondsSinceEpoch(widget.team.schedule))}",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
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
