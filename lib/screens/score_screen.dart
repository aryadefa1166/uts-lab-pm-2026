import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  final String userName;
  final int score;
  final int totalQuestions;

  const ScoreScreen({
    super.key,
    required this.userName,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = (score / totalQuestions) * 100;
    String message = '';

    if (percentage >= 80) {
      message = 'Luar Biasa!';
    } else if (percentage >= 60) {
      message = 'Kerja Bagus!';
    } else {
      message = 'Terus Belajar!';
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.emoji_events,
                    size: 120,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Selamat, $userName!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Skor akhir kamu:',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '$score / $totalQuestions',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 48),
                  CustomButton(
                    text: 'Main Lagi',
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                            (route) => false,
                      );
                    },
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