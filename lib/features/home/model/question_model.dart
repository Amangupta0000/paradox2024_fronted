class QuestionModel {
  QuestionModel({
    required this.id1,
    required this.id,
    required this.answer,
    required this.image,
    required this.question,
    required this.hint,
    required this.isHintAvailable,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
  late final  id1;
  late final  id;
  late final  answer;
  late final image;
  late final  question;
  late final  hint;
  late final  isHintAvailable;
  late final  createdAt;
  late final  updatedAt;
  late final  v;

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id1 = json['_id'];
    id = json['id'];
    answer = json['answer'];
    image = json['image'];
    question = json['question'];
    hint = json['hint'];
    isHintAvailable = json['isHintAvailable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json[' __v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id1'] = id1;
    _data['id'] = id;
    _data['answer'] = answer;
    _data['image'] = image;
    _data['question'] = question;
    _data['hint'] = hint;
    _data['isHintAvailable'] = isHintAvailable;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data[' v'] = v;
    return _data;
  }
}
