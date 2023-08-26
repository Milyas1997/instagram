import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CloudFirebaseStorage {
  static FilePickerResult? result;
  static filePicker() async {
    result = await FilePicker.platform.pickFiles();
    File? myfile = File(result!.files.single.path!);

    return await myfile.readAsBytes();
  }

  static final _storage = FirebaseStorage.instance;

  static Future<String> uploadImage(File file, String name) async {
    final ref = _storage.ref("images/$name");
    final uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.whenComplete(() {
      debugPrint("Uploaded");
    });
    debugPrint(snapshot.ref.getDownloadURL().toString());
    return await snapshot.ref.getDownloadURL();
  }
}
