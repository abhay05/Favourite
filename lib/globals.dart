import 'package:favourite/widgets/MatchCard.dart';
import 'package:flutter/material.dart';

class Globals {
  static final GlobalKey<MatchCardState> FootballMatchCardglobalKey =
      GlobalKey<MatchCardState>();
  static GlobalKey<MatchCardState> get() {
    return FootballMatchCardglobalKey;
  }
}
