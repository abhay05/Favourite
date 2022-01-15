class PlayerMatchBattingStats {
  String id;
  String name;
  int runs;
  double strike_rate;
  int fours;
  int sixes;
  int balls_faced;
  String bowled_by; // bowler name ; not provided needs to enriched
  String dismissal_type; // how the player got out;
  String fieldsman_name; // fielder who caught , did run out
  String match_id;

  PlayerMatchBattingStats({
    this.id,
    this.name,
    this.runs,
    this.strike_rate,
    this.fours,
    this.sixes,
    this.balls_faced,
    this.bowled_by,
    this.fieldsman_name,
    this.dismissal_type,
    this.match_id,
  });
}

class PlayerMatchBowlingStats {
  String id;
  String name;
  int runs_conceded;
  int overs_bowled;
  int wickets;
  int maidens;
  int dot_balls;
  int fours_conceded;
  int no_balls;
  int wides;
  double economy_rate;
  double fastest_delivery;
  double average_speed;
  String match_id;

  PlayerMatchBowlingStats({
    this.id,
    this.name,
    this.runs_conceded,
    this.overs_bowled,
    this.wickets,
    this.maidens,
    this.dot_balls,
    this.fours_conceded,
    this.no_balls,
    this.wides,
    this.economy_rate,
    this.fastest_delivery,
    this.average_speed,
    this.match_id,
  });
}

class TeamMatchStats {
  String id;
  int innings_no;
  String match_id;
  int runs;
  int fours;
  int sixes;
  double run_rate;
  int overs; // get from balls faced balls_faced;

  TeamMatchStats({
    this.id,
    this.innings_no,
    this.match_id,
    this.runs,
    this.fours,
    this.sixes,
    this.run_rate,
    this.overs,
  });
}

class MatchSchedule {
  String id;
  String tournament_id;
  int schedule; // time in secocnds
  String status;
  String season_name;
  //String tournament_id;
  String tournament_name;
  String name1;
  String abbr1;
  String name2;
  String abbr2;

  MatchSchedule({
    this.id,
    this.tournament_id,
    this.schedule,
    this.status,
    this.season_name,
    this.tournament_name,
    this.abbr1,
    this.abbr2,
    this.name1,
    this.name2,
  });
}
