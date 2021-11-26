class TeamStats {
  final ball_possession;
  final card_given;
  final corner_kicks;
  final fouls;
  final free_kicks;
  final goal_kicks;
  final injuries;
  final offsides;
  final red_cards;
  final shots_blocked;
  final shots_off_target;
  final shots_on_target;
  final shots_saved;
  final shots_total;
  final substitutions;
  final throw_ins;
  final yellow_cards;
  final yellow_red_cards;

  TeamStats({
    this.ball_possession,
    this.card_given,
    this.corner_kicks,
    this.fouls,
    this.free_kicks,
    this.goal_kicks,
    this.injuries,
    this.offsides,
    this.red_cards,
    this.shots_blocked,
    this.shots_off_target,
    this.shots_on_target,
    this.shots_saved,
    this.shots_total,
    this.substitutions,
    this.throw_ins,
    this.yellow_cards,
    this.yellow_red_cards,
  });

  Map<String,dynamic>getStatsMap(){
    Map<String,dynamic> dict={};
    dict= {
      "ball_possession":this.ball_possession,
      "card_given":this.card_given,
      "corner_kicks":this.corner_kicks,
      "fouls":this.fouls,
      "free_kicks":this.free_kicks,
      "goal_kicks":this.goal_kicks,
      "injuries":this.injuries,
      "offsides":this.offsides,
      "red_cards":this.red_cards,
      "shots_blocked":this.shots_blocked,
      "shots_off_target":this.shots_off_target,
      "shots_on_target":this.shots_on_target,
      "shots_saved":this.shots_saved,
      "shots_total":this.shots_total,
      "substitutions":this.substitutions,
      "throw_ins":this.throw_ins,
      "yellow_cards":this.yellow_cards,
      "yellow_red_cards":this.yellow_red_cards
    };
    return dict;
  }
  
}

class FootballMatchStats {
  final kick_off;
  final winner;
  final home_team;
  final away_team;
  final home_team_goals;
  final away_team_goals;
   TeamStats home_team_stats=TeamStats();
   TeamStats away_team_stats=TeamStats();

  FootballMatchStats({
    this.kick_off,
    this.winner,
    this.home_team,
    this.away_team,
    this.away_team_goals,
    this.away_team_stats,
    this.home_team_goals,
    this.home_team_stats,
  });
}
