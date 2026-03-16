import 'package:flutter/material.dart';

/// Social media icon button with hover state.
///
/// Used in the contact/about sections for social links.
class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? tooltip;
  final VoidCallback? onPressed;
  final Color? color;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.label,
    this.tooltip,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: tooltip ?? label,
      child: Tooltip(
        message: tooltip ?? label,
        child: IconButton(
          icon: Icon(icon, color: color),
          onPressed: onPressed,
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
