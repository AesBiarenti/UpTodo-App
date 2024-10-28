import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/sheets/float_ac_bottom_sheets.dart';

class FloatAcButton extends StatefulWidget {
  const FloatAcButton({super.key});

  @override
  State<FloatAcButton> createState() => _FloatAcButtonState();
}

class _FloatAcButtonState extends State<FloatAcButton> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        floatAcButtonBottomSheet(context,_taskController,_descController);
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.deepPurple.shade500,
        ),
        child: const Icon(Icons.add, size: 35),
      ),
    );
  }
}
