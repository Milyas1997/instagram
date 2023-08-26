import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonText,
  });
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
