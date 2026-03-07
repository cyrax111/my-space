import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Text with an animated gradient effect.
///
/// Used for hero sections and attention-grabbing headings.
class AnimatedGradientText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const AnimatedGradientText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  State<AnimatedGradientText> createState() => _AnimatedGradientTextState();
}

class _AnimatedGradientTextState extends State<AnimatedGradientText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment(-1.0 + _controller.value * 2, 0),
              end: Alignment(1.0 + _controller.value * 2, 0),
              colors: const [
                AppColors.primary,
                AppColors.secondary,
                AppColors.primary,
              ],
            ).createShader(bounds);
          },
          child: Text(
            widget.text,
            style: (widget.style ?? const TextStyle()).copyWith(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
