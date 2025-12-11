import 'package:flutter/material.dart';
import 'screens/start_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'models/question.dart';
import 'models/answer.dart';
import 'models/result.dart';
import 'models/userAnswer.dart';
import 'data/quiz_data.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const QuizHome(),
    );
  }
}

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});
  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  String currentScreen = 'start';

  List<Question> questions = [];
  List<Answer> answers = [];
  Result? currentResult;
  List<UserAnswer> currentUserAnswers = [];

  @override
  void initState() {
    super.initState();

    questions = QuizData.getQuestions();
    answers = QuizData.getAnswers();
  }

  void startQuiz() {
    setState(() {
      currentScreen = 'question';
    });
  }

  void completeQuiz(List<String> selectedAnswerIds) {
    int score = 0;
    List<UserAnswer> userAnswers = [];

    String resultId = 'result_${DateTime.now().millisecondsSinceEpoch}';

    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      final selectedAnswerId = selectedAnswerIds[i];

      final selectedAnswer = answers.firstWhere(
        (a) => a.answerId == selectedAnswerId,
      );

      bool isCorrect = selectedAnswer.isCorrect;
      if (isCorrect) score++;

      userAnswers.add(
        UserAnswer(
          userAnswerId: 'ua_${DateTime.now().millisecondsSinceEpoch}_$i',
          resultId: resultId,
          questionId: question.questionId,
          answerId: selectedAnswerId,
          isCorrect: isCorrect,
        ),
      );
    }

    double percentage = (score / questions.length) * 100;

    final result = Result(
      resultId: resultId,
      score: score,
      totalQuestions: questions.length,
      percentage: percentage,
      completedAt: DateTime.now(),
    );

  

    setState(() {
      currentResult = result;
      currentUserAnswers = userAnswers;
      currentScreen = 'result';
    });
  }

  void restartQuiz() {
    setState(() {
      currentResult = null;
      currentUserAnswers = [];
      currentScreen = 'start';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildScreen());
  }

  Widget _buildScreen() {
    switch (currentScreen) {
      case 'start':
        return StartScreen(onStartQuiz: startQuiz);
      case 'question':
        return QuestionScreen(
          questions: questions,
          answers: answers,
          onQuizComplete: completeQuiz,
        );
      case 'result':
        return ResultScreen(
          result: currentResult!,
          userAnswers: currentUserAnswers,
          questions: questions,
          answers: answers,
          onRestartQuiz: restartQuiz,
        );
      default:
        return StartScreen(onStartQuiz: startQuiz);
    }
  }
}
