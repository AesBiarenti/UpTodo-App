import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/sheets/go_back_dialogs.dart';
import 'package:uptodo_app/presentation/widgets/primary_button.dart';
import 'package:uptodo_app/presentation/widgets/secondary_button.dart';
import 'package:uptodo_app/presentation/widgets/svg_widget.dart';
import 'package:uptodo_app/presentation/widgets/textfield.dart';
import 'package:uptodo_app/routes/routes.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _isPasswordVisible = false;
  final bool _isConfirmPasswordVisible = false;
  bool _isButtonEnabled = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _checkFormValidity() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty;
    });
  }

  Future<bool> _onWillPop() async {
    if (_usernameController.text.isNotEmpty ||
        _passwordController.text.isNotEmpty ||
        _confirmPasswordController.text.isNotEmpty) {
      // Kullanıcıya uyarı göster
      return await showConfirmationDialog(context);
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_checkFormValidity);
    _passwordController.addListener(_checkFormValidity);
    _confirmPasswordController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 30),
              const Text("Username"),
              TextFieldWidget(
                controller: _usernameController, // Controller ekledik
                placeHolder: "Enter Your User Name",
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10),
              const Text("Password"),
              TextFieldWidget(
                controller: _passwordController, // Controller ekledik
                placeHolder: "Enter Your Password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 10),
              const Text("Confirm Password"),
              TextFieldWidget(
                controller: _confirmPasswordController, // Controller ekledik
                placeHolder: "Confirm Your Password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: !_isConfirmPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: PrimaryButton(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  content: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _isButtonEnabled
                      ? () {
                          Navigator.pushNamed(context, AppRoutes.homePage);
                        }
                      : null,
                  isEnabled: _isButtonEnabled,
                ),
              ),
              const SizedBox(height: 15),
              const Divider(),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Or",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const Divider(),
              SecondaryButton(
                height: 60,
                width: MediaQuery.of(context).size.width,
                content: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgWidget(assetName: "google"),
                      Text("Login With Google")
                    ]),
                onPressed: () {},
              ),
              SecondaryButton(
                height: 60,
                width: MediaQuery.of(context).size.width,
                content: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(child: SvgWidget(assetName: "apple")),
                      Text("Login With Apple")
                    ]),
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.loginPage);
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(text: "Already have an account? "),
                        TextSpan(
                            text: "Login",
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
