import '../models/question.dart';
import '../models/answer.dart';

class QuizData {
  // Get all questions
  static List<Question> getQuestions() {
    return [
      Question(
        questionId: 'q1',
        text: 'Who is the best teacher?',
        points: 1,
      ),
      Question(
        questionId: 'q2',
        text: 'What is the best color?',
        points: 1,
      ),
      Question(
        questionId: 'q3',
        text: 'Which framework is best for mobile?',
        points: 1,
      ),
      Question(
        questionId: 'q4',
        text: 'What is 2 + 2?',
        points: 1,
      ),
    ];
  }

  static List<Answer> getAnswers() {
    return [
      // Answers for Q1
      Answer(
        answerId: 'a1',
        questionId: 'q1',
        text: 'Ronan',
        isCorrect: true,
      ),
      Answer(
        answerId: 'a2',
        questionId: 'q1',
        text: 'Hongly',
        isCorrect: false,
      ),
      Answer(
        answerId: 'a3',
        questionId: 'q1',
        text: 'Leangsiv',
        isCorrect: false,
      ),
      
      // Answers for Q2
      Answer(
        answerId: 'a4',
        questionId: 'q2',
        text: 'Blue',
        isCorrect: false,
      ),
      Answer(
        answerId: 'a5',
        questionId: 'q2',
        text: 'Red',
        isCorrect: false,
      ),
      Answer(
        answerId: 'a6',
        questionId: 'q2',
        text: 'Green',
        isCorrect: true,
      ),
      
      // Answers for Q3
      Answer(
        answerId: 'a7',
        questionId: 'q3',
        text: 'Flutter',
        isCorrect: true,
      ),
      Answer(
        answerId: 'a8',
        questionId: 'q3',
        text: 'React Native',
        isCorrect: false,
      ),
      Answer(
        answerId: 'a9',
        questionId: 'q3',
        text: 'Ionic',
        isCorrect: false,
      ),
      
      // Answers for Q4
      Answer(
        answerId: 'a10',
        questionId: 'q4',
        text: '3',
        isCorrect: false,
      ),
      Answer(
        answerId: 'a11',
        questionId: 'q4',
        text: '4',
        isCorrect: true,
      ),
      Answer(
        answerId: 'a12',
        questionId: 'q4',
        text: '5',
        isCorrect: false,
      ),
    ];
  }

  static List<Answer> getAnswersForQuestion(String questionId) {
    return getAnswers().where((answer) => answer.questionId == questionId).toList();
  }
}