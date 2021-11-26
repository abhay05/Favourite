import 'package:favourite/widgets/FootballMatchCard.dart';
import 'package:flutter/material.dart';

class Globals {
 static final GlobalKey<FootballMatchCardState> FootballMatchCardglobalKey=GlobalKey<FootballMatchCardState>();
  static GlobalKey<FootballMatchCardState> get() {
    return FootballMatchCardglobalKey;
  }
}
