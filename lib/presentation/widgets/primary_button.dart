import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget content;
  const PrimaryButton({
    required this.height,
    required this.width,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Colors.deepPurple.shade500,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        onPressed: () {},
        child: content
      ),
    );
  }
}
