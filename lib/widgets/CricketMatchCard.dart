import 'package:flutter/material.dart';

import '../models/CricketMatchStats.dart';

class CricketMatchCard extends StatelessWidget {
  final MatchSchedule teamStats;
  CricketMatchCard(this.teamStats);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
    );
  }
}
