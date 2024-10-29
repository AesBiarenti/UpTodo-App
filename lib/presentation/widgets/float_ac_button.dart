import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/sheets/add_task_bottom_sheet/sheet_container.dart';


class FloatAcButton extends StatefulWidget {
  const FloatAcButton({super.key});

  @override
  State<FloatAcButton> createState() => _FloatAcButtonState();
}

class _FloatAcButtonState extends State<FloatAcButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const SheetContainer();
          },
        );
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
