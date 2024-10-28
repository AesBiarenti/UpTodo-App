import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/widgets/textfield.dart';

void floatAcButtonBottomSheet(
    BuildContext context, TextEditingController controller,TextEditingController controller2) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        color: Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Task",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                  controller: controller,
                  placeHolder: "Add Task",
                  keyboardType: TextInputType.text),
                      const SizedBox(height: 10),
              TextFieldWidget(
                  controller: controller,
                  placeHolder: "Description",
                  keyboardType: TextInputType.text)
            ],
          ),
        ),
      );
    },
  );
}
