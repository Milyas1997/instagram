import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/model/user_model.dart';

class FireStoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static late final String result;

  static Future<String> addUser({required UserModel user}) async {
    try {
      await _firestore.collection('User').doc(user.uid).set(user.toJson());
      return result = 'sucess';
    } catch (e) {
      return result = e.toString();
    }
  }
}
