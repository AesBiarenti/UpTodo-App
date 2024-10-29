import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/widgets/svg_widget.dart';
import 'package:uptodo_app/presentation/widgets/textfield.dart';

class AddTaskPage extends StatelessWidget {
  final TextEditingController taskTitleController;
  final TextEditingController taskDescController;
  final void Function()? onTap;
  const AddTaskPage(
      {required this.taskTitleController,
      required this.taskDescController,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add Task",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        TextFieldWidget(
            controller: taskTitleController,
            placeHolder: "Add Task",
            keyboardType: TextInputType.text),
        const SizedBox(height: 10),
        TextFieldWidget(
            controller: taskDescController,
            placeHolder: "Description",
            keyboardType: TextInputType.text),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                SvgWidget(assetName: "timer"),
                SvgWidget(assetName: "tag"),
                SvgWidget(assetName: "flag"),
              ],
            ),
            GestureDetector(onTap: onTap,child: const SvgWidget(assetName: "send"))
          ],
        ),
      ],
    );
  }
}
