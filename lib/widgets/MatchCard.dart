import 'package:flutter/material.dart';
import '../models/Match.dart';
import 'package:intl/intl.dart';
import '../screens/Match_Stats.dart';
import '../globals.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Theme.dart';

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
    if (widget.team.game == "cricket" ||
        widget.team.game == "basketball" ||
        widget.team.game == "hockey") {
      print("CRICKET");
      return ClipRRect(
        child: Image(
          image: AssetImage(imageUri + ".png"),
          fit: BoxFit.contain,
          height: 60,
          width: 60,
        ),
      );
    } else {
      try {
        SvgPicture.asset(
          imageUri + ".svg",
          width: 60,
          height: 60,
        );
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
          width: 60,
          height: 60,
        ),
        fit: BoxFit.cover,
        width: 60,
        height: 60,
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
        color: Color(0xffF5F5F5),

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
          height: mediaQuery.size.height / 5, //6.8,
          width: (mediaQuery.size.width - 20) / 2, //3
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  5,
                ),
              ),
              border: Border.all(
                color: Colors.black,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: widget.team.game == "football"
                    ? [Color(0xff3d195b), Color(0xff3d195b)]
                    : widget.team.game == "basketball"
                        ? [
                            Color(0xff17408B),
                            // Color(0xffFFFFFF),
                            Color(0xffC9082A)
                          ]
                        : widget.team.game == "hockey"
                            ? [Color(0xff000000), Color(0xffD1D7DB)]
                            : [
                                Color(0xff8c182b),
                                Color(0xff8c182b)
                              ], //0xffDE3F5A
              )
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
                height: 120,
                decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.orange,
                    // ),
                    ),

                ///mediaQuery.size.height / 5
                width: (mediaQuery.size.width - 20) / 2,
                //padding: EdgeInsets.only(left: 2),
                child: //Text("jel"),

                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tryCatch(
                      "assets/images/${widget.team.team1.toString().toLowerCase()}",
                    ),
                    Text(
                      " VS ",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
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
                top: 100,
                // left: 10,
                child: Opacity(
                  opacity: .8,
                  child: Container(
                    width: (mediaQuery.size.width - 20) / 2,
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
                          style: CardTextTheme.cardTextTheme
                              .bodyText2, //Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${DateFormat.yMMMEd().format(DateTime.fromMillisecondsSinceEpoch(widget.team.schedule))}",
                          style: CardTextTheme.cardTextTheme.bodyText2,
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
