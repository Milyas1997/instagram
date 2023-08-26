import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screen/signin_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SignInScreen()

        //  StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData && snapshot.data != null) {
        //         if (snapshot.data!.emailVerified) {
        //           return const HomeScreen();
        //         } else {
        //           FirebaseAuth.instance.signOut();

        //           return const SignInScreen();
        //         }
        //       } else {
        //         return const SignInScreen();
        //       }
        //}
        // );
        );
  }
}
