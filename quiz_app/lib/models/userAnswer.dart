class UserAnswer {
  final String userAnswerId;
  final String resultId;
  final String questionId;
  final String answerId;
  final bool isCorrect;

  UserAnswer({
    required this.userAnswerId,
    required this.resultId,
    required this.questionId,
    required this.answerId,
    required this.isCorrect,
  });
}