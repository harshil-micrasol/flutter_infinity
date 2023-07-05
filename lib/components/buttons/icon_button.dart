import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppIconButton extends StatelessWidget {
  final double size;
  final VoidCallback onPressed;
  final Widget icon;
  final String? tooltip;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? splashColor;
  final Color? shadowColor;
  final bool? disableButton;
  final bool enableFeedback;

  const AppIconButton({
    super.key,
    this.tooltip,
    this.size = 32,
    required this.onPressed,
    this.borderRadius,
    required this.icon,
    this.backgroundColor,
    this.borderColor,
    this.splashColor,
    this.shadowColor,
    this.disableButton = false,
    this.enableFeedback = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: borderColor != null ? Border.all(color: borderColor!.withOpacity(withMyOpacity)) : null,
      ),
      child: IconButton(
        onPressed: disableButton == false
            ? () {
                if (enableFeedback) {
                  HapticFeedback.lightImpact();
                }
                onPressed();
              }
            : null,
        iconSize: size,
        splashRadius: size / 1.5,
        splashColor: splashColor,
        padding: EdgeInsets.zero,
        tooltip: tooltip,
        style: IconButton.styleFrom(shadowColor: shadowColor),
        icon: ClipOval(
          child: Material(
            color: backgroundColor?.withOpacity(withMyOpacity) ?? Colors.transparent,
            child: Center(child: icon),
          ),
        ),
      ),
    );
  }

  double get withMyOpacity {
    return disableButton == false ? 1 : .4;
  }
}
