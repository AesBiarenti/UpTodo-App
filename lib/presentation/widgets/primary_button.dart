import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget content;
  final void Function()? onPressed;
  final bool isEnabled;

  const PrimaryButton({
    required this.height,
    required this.width,
    required this.content,
    required this.onPressed,
    this.isEnabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isEnabled ? Colors.deepPurple.shade500 : Colors.deepPurple.shade200,
          ),
          foregroundColor: WidgetStateProperty.all(
            isEnabled ? Colors.white : Colors.white.withOpacity(0.6),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        onPressed: isEnabled ? onPressed : null,
        child: content,
      ),
    );
  }
}
