import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget content;
  const SecondaryButton(
      {required this.height,
      required this.width,
      required this.content,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
         height:  height,
      width: width,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        child: content,
      ),
    );
  }
}
