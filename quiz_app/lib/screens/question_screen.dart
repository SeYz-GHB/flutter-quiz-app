import 'package:flutter/material.dart';
import '../models/question.dart';
import '../models/answer.dart';

class QuestionScreen extends StatefulWidget {
  
  final List<Question> questions;
  final List<Answer> answers;
  final Function(List<String>) onQuizComplete;

  const QuestionScreen({
    Key? key,
    required this.questions,
    required this.answers,
    required this.onQuizComplete,
  }) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  int currentQuestionIndex = 0;
  List<String> selectedAnswerIds = [];

  void selectedAnswer(String answerId) {
    selectedAnswerIds.add(answerId);

    if(currentQuestionIndex < widget.questions.length-1) {
      setState(() {
        currentQuestionIndex ++;
      });
    }
    else{
      widget.onQuizComplete(selectedAnswerIds);
    }
  }

  List<Answer> getAnswersForQuestion() {
    final currentQuestion = widget.questions[currentQuestionIndex];
    return widget.answers.where((answer) => answer.questionId == currentQuestion.questionId).toList();
  }

  @override
  Widget build(BuildContext context) {

    final currentQuestion = widget.questions[currentQuestionIndex];
    final currentAnswers = getAnswersForQuestion();

    return Container(
      child: Center(
        child: Padding(padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Question ${currentQuestionIndex +1}/${widget.questions.length}',
              style: const TextStyle(fontSize: 18, color: Colors.white70,),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color : Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
              ),
              child : Text (
                currentQuestion.text,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

              )
            ),
            const SizedBox(height: 20,),

            ...currentAnswers.map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => selectedAnswer(answer.answerId),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 3,
                  ),
                  child : Text(answer.text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
                ),
              );
            }).toList(),
            
          ],
        ),
        ),
      ),
    );
  }
}