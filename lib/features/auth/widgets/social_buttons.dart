import 'package:cinemax/features/auth/widgets/circular_button.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Button
        CirularButton(
          backgroundColor: Colors.white,
          child: Image.asset(
            'assets/images/googleLogo.png',
            width: 26,
            height: 26,
          ),
          onPressed: () {
            // Add Google sign-in logic
          },
        ),
        const SizedBox(width: 24),
        // Facebook Button
        CirularButton(
          backgroundColor: const Color(0xFF4267B2),
          child: const Text(
            'f',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'sans-serif', // Clean sans-serif look for the "f"
            ),
          ),
          onPressed: () {
            // Add Facebook sign-in logic
          },
        ),
      ],
    );
  }
}
