import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uptodo_app/presentation/widgets/primary_button.dart';
import 'package:uptodo_app/presentation/widgets/secondary_button.dart';
import 'package:uptodo_app/routes/routes.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              children: [
                Text(
                  "Welcome To Up Todo",
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "Please login to your account or create new account to continue",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 100),
            Column(
              children: [
                PrimaryButton(
                  height: 60,
                  width: 300,
                  content: const Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.loginPage);
                  },
                ),
                const SizedBox(height: 10),
                SecondaryButton(
                  height: 60,
                  width: 300,
                  content: const Text(
                    "CREATE ACOOUNT",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                     Navigator.pushNamed(context, AppRoutes.signupPage);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
