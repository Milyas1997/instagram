import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/screen/signup_screen.dart';
import 'package:instagram/widget/button.dart';

import '../widget/textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final lh = const SizedBox(
    height: 20,
  );
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/instagram.svg",
              height: 80,
              width: 80,
              color: Colors.white,
            ),
            lh,
            AppFormField(
              contoller: emailController,
              keyboardAs: TextInputType.emailAddress,
              labelText: 'Email',
              preIcon: Icons.email,
            ),
            lh,
            lh,
            AppFormField(
              isObsecure: true,
              contoller: passwordController,
              keyboardAs: TextInputType.visiblePassword,
              labelText: 'Password',
              preIcon: Icons.password,
            ),
            lh,
            lh,
            const AppButton(
              buttonText: 'Sign In',
            ),
            lh,
            lh,
            lh,
            RichText(
              text: TextSpan(
                text: 'Dont have an account? ',
                style: const TextStyle(color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint('Sign UP is pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                    text: 'Sign Up',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
