import 'package:flutter/material.dart';

class CirularButton extends StatelessWidget {
  const CirularButton({
    super.key,
    required this.backgroundColor,
    required this.child,
    required this.onPressed,
  });

  final Color backgroundColor;
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Center(child: child),
      ),
    );
  }
}
