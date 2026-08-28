import 'package:flutter/material.dart';

class AnimatedBorder extends StatefulWidget {
  final int currentPage;
  final double size;
  final double strokeWidth;
  final Color color;

  const AnimatedBorder({
    super.key,
    required this.currentPage,
    this.size = 70,
    this.strokeWidth = 2,
    this.color = Colors.cyan,
  });

  @override
  State<AnimatedBorder> createState() => _AnimatedBorderState();
}

class _AnimatedBorderState extends State<AnimatedBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  double _oldStart = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = AlwaysStoppedAnimation(_oldStart);
  }

  @override
  void didUpdateWidget(covariant AnimatedBorder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentPage != widget.currentPage) {
      final newStart = _getStartPosition(widget.currentPage);

      _animation = Tween<double>(
        begin: _oldStart,
        end: newStart,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

      _oldStart = newStart;

      _controller
        ..reset()
        ..forward();
    }
  }

  double _getStartPosition(int page) {
    switch (page) {
      case 0:
        // Top-right
        return 0.0;

      case 1:
        // Right / bottom
        return 0.25;

      case 2:
        // Left / top
        return 0.50;

      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: _BorderPainter(
            progress: _animation.value,
            color: widget.color,
            strokeWidth: widget.strokeWidth,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _BorderPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _BorderPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(
      strokeWidth,
      strokeWidth,
      size.width - strokeWidth * 2,
      size.height - strokeWidth * 2,
    );

    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(20));

    final path = Path()..addRRect(rRect);

    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      final length = metric.length;

      // Length of the visible border
      final visibleLength = length * 0.65;

      // Where the border starts
      final start = length * progress;

      Path animatedPath;

      if (start + visibleLength <= length) {
        animatedPath = metric.extractPath(start, start + visibleLength);
      } else {
        // Continue from beginning when reaching the end
        final firstPart = metric.extractPath(start, length);

        final secondPart = metric.extractPath(
          0,
          (start + visibleLength) - length,
        );

        animatedPath = Path()
          ..addPath(firstPart, Offset.zero)
          ..addPath(secondPart, Offset.zero);
      }

      canvas.drawPath(animatedPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BorderPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
