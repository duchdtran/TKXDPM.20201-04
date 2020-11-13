import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon(
      this.icon,
      this.size,
      this.gradient,
      );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        final rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
    );
  }
}