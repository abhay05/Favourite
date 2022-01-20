import 'package:flutter/material.dart';

class LeagueName extends StatelessWidget {
  final String leagueName;
  LeagueName(this.leagueName);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        left: 5,
        top: 10,
      ),
      child: Text(
        this.leagueName,
        style: TextStyle(
          color: Colors.black, //Theme.of(context).primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          decorationThickness: 22,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
    );
  }
}
