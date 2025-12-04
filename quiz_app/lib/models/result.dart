class Result {
  final String resultId;
  final int score;
  final int totalQuestions;
  final double percentage;
  final DateTime completedAt;

  Result({required this.resultId, required this.score, required this.totalQuestions, required this.percentage, required this.completedAt});

  String getGrade() {
    if (percentage >= 90) return 'A';
    if (percentage >= 80) return 'B';
    if (percentage >= 70) return 'C';
    if (percentage >= 60) return 'D';
    return 'F';
  }
}