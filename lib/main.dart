import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screen/home_screen.dart';
import 'package:instagram/screen/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                if (snapshot.data!.emailVerified) {
                  return const HomeScreen();
                } else {
                  FirebaseAuth.instance.signOut();

                  return const SignInScreen();
                }
              } else {
                return const SignInScreen();
              }
            }));
  }
}
