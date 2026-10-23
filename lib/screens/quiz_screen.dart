import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../widgets/option_card.dart';
import 'score_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName;

  const QuizScreen({super.key, required this.userName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isAnswered = false;
  int? _selectedOptionIndex;

  void _checkAnswer(int selectedIndex) {
    if (_isAnswered) return;

    setState(() {
      _isAnswered = true;
      _selectedOptionIndex = selectedIndex;

      if (selectedIndex == dummyQuestions[_currentQuestionIndex].correctOptionIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < dummyQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _isAnswered = false;
        _selectedOptionIndex = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(
            userName: widget.userName,
            score: _score,
            totalQuestions: dummyQuestions.length,
          ),
        ),
      );
    }
  }

  Color _getOptionColor(int index) {
    if (!_isAnswered) {
      return Theme.of(context).scaffoldBackgroundColor;
    }

    final int correctIndex = dummyQuestions[_currentQuestionIndex].correctOptionIndex;

    if (index == correctIndex) {
      return Colors.green.shade400;
    }

    if (index == _selectedOptionIndex && index != correctIndex) {
      return Colors.red.shade400;
    }

    return Theme.of(context).scaffoldBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = dummyQuestions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis Berlangsung'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Pertanyaan ${_currentQuestionIndex + 1} dari ${dummyQuestions.length}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      currentQuestion.questionText,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentQuestion.options.length,
                      itemBuilder: (context, index) {
                        return OptionCard(
                          optionText: currentQuestion.options[index],
                          color: _getOptionColor(index),
                          onTap: () => _checkAnswer(index),
                        );
                      },
                    ),
                  ),
                  if (_isAnswered)
                    ElevatedButton(
                      onPressed: _nextQuestion,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _currentQuestionIndex == dummyQuestions.length - 1
                            ? 'Lihat Hasil'
                            : 'Pertanyaan Selanjutnya',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}