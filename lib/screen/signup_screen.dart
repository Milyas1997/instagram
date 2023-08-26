import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/services/authentication/auth_service.dart';
import 'package:instagram/services/firestore/firestore_service.dart';
import 'package:instagram/services/storage/storage_service.dart';
import 'package:instagram/widget/button.dart';
import 'package:instagram/widget/textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPassController;
  final lh = const SizedBox(
    height: 20,
  );
  Uint8List? filee;
  bool isShown = false;
  String? url;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          width: double.infinity,
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/images/instagram.svg",
                height: 80,
                width: 80,
                color: Colors.white,
              ),
              lh,
              Stack(
                children: [
                  filee != null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage: MemoryImage(filee!),
                        )
                      : const CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            'https://www.pngitem.com/pimgs/m/517-5177724_vector-transparent-stock-icon-svg-profile-user-profile.png',
                          ),
                        ),
                  Positioned(
                    bottom: 5,
                    right: 0,
                    child: IconButton(
                        onPressed: () async {
                          var result = await CloudFirebaseStorage.filePicker();
                          //File myfile =File(result!.files.single.path.toString());

                          setState(() {
                            filee = result;

                            isShown = true;
                          });
                          //filee =await myfile.readAsBytes();

                          // CloudFirebaseStorage.uploadImage(filee!,
                          //     DateTime.now().microsecondsSinceEpoch.toString());
                          const snackBar = SnackBar(
                            content: Text('Yay! Picture is shown'),
                          );
                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              lh,
              AppFormField(
                contoller: nameController,
                keyboardAs: TextInputType.name,
                labelText: 'Name',
                preIcon: Icons.person,
              ),
              lh,
              AppFormField(
                contoller: emailController,
                keyboardAs: TextInputType.emailAddress,
                labelText: 'Email',
                preIcon: Icons.email,
              ),
              lh,
              AppFormField(
                isObsecure: true,
                contoller: passwordController,
                keyboardAs: TextInputType.visiblePassword,
                labelText: 'Password',
                preIcon: Icons.password,
              ),
              lh,
              AppFormField(
                isObsecure: true,
                contoller: confirmPassController,
                keyboardAs: TextInputType.visiblePassword,
                labelText: 'Confirm password',
                preIcon: Icons.password,
              ),
              lh,
              GestureDetector(
                onTap: () async {
                  String result = await AuthService.createUser(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                  if (result != 'sucess') {
                    if (!mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result),
                      ),
                    );
                  } else {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Congrats for sign up'),
                      ),
                    );
                  }
                },
                child: const AppButton(
                  buttonText: 'Sign Up',
                ),
              ),
              lh,
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('Sign IN is pressed');
                        },
                      text: 'Sign in',
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
      ),
    );
  }
}
