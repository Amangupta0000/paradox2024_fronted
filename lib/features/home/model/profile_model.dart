class ProfileModel {
  ProfileModel({
    required this.name,
    required this.uid,
    required this.displayPicture,
    required this.refCode,
    required this.teamCode,
    required this.level,
    required this.teamName,
    required this.attempts,
    required this.score,
  });
  late final String name;
  late final String uid;
  late final String? displayPicture;
  late final String? refCode;
  late final String? teamCode;
  late final int level;
  late final String? teamName;
  late final int attempts;
  late final int score;
  
  ProfileModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    uid = json['uid'];
    displayPicture = json['displayPicture'];
    refCode = json['ref_code'];
    teamCode = json['team_code'];
    level = json['level'];
    teamName = json['teamName'];
    attempts = json['attempts'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['uid'] = uid;
    _data['displayPicture'] = displayPicture;
    _data['ref_code'] = refCode;
    _data['team_code'] = teamCode;
    _data['level'] = level;
    _data['teamName'] = teamName;
    _data['attempts'] = attempts;
    _data['score'] = score;
    return _data;
  }
}