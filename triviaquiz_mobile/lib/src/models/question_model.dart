class Question {
  String id;
  String value;
  String correctAnswer;
  List<String> incorrectAnswers;
  QuestionType type;
  QuestionDifficulty difficulty;
}

enum QuestionType {
  boolean, multiple
}

enum QuestionDifficulty {
  easy, medium, hard
}