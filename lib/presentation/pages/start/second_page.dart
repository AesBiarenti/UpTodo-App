import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/widgets/primary_button.dart';
import 'package:uptodo_app/presentation/widgets/secondary_button.dart';

class StartSecondPage extends StatelessWidget {
  const StartSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SecondaryButton(
              height: 50,
              width: 100,
              content: Text("Back"),
            ),
            PrimaryButton(
              height: 50,
              width: 100,
              content: Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}
