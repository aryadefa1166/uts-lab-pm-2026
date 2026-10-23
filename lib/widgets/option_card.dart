import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String optionText;
  final Color color;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.optionText,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: double.infinity, // Ukuran dinamis
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade300
                : Colors.grey.shade800,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          optionText,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black87
                : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}