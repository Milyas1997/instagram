import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static String? _result;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<String> createUser(
      {required String email, required String password}) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        return _result = 'all fields shoul be filled';
      } else {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        _result = 'sucess';
        return _result.toString();
      }
    } catch (e) {
      return _result = e.toString();
    }
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _result = 'sucess';
      return _result.toString();
    } catch (e) {
      return _result = e.toString();
    }
  }

  Future<String> signOutUser() async {
    try {
      _result = 'sucess';
      await _auth.signOut();
      return _result.toString();
    } catch (e) {
      return _result = e.toString();
    }
  }
}
