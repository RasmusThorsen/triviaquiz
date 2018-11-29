import 'package:json_annotation/json_annotation.dart';
part 'question_model.g.dart';

@JsonSerializable()
class Question {
  String id;
  String value;
  String correctAnswer;
  List<String> incorrectAnswers;
  QuestionType type;
  QuestionDifficulty difficulty;

  Question({this.id, this.value, this.correctAnswer, this.difficulty, this.incorrectAnswers, this.type});

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

enum QuestionType {
  boolean, multiple
}

enum QuestionDifficulty {
  easy, medium, hard
}