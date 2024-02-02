import 'package:fetch_product/utils/custom_widgets/toasters.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseAuth {
  Future<User?> signInWithEmailPassword(String? email, String? password);
  Future<User?> createUserWithEmailPassword(String? email, String? password);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> createUserWithEmailPassword(
      String? email, String? password) async {
    try {
      var user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email!, password: password!))
          .user;

      return user;
    } on FirebaseAuthException catch (e) {
      ZBotToast.loadingClose();
      debugPrint("Firebase Auth Error: $e");

      if (e.code == 'email-already-in-use') {
        Get.snackbar(
            'Error', 'The email address is already in use by another account');
      } else if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'TInvalid email address, user not found');
      } else {
        Get.snackbar('Error', 'Error: ${e.message}');
      }
      return null;
    }
  }

  @override
  Future<User?> signInWithEmailPassword(String? email, String? password) async {
    debugPrint("sign in method");
    try {
      var user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email!, password: password!))
          .user;
      return user;
    } catch (e) {
      String error = e.toString();
      debugPrint("sign in error $e");
      ZBotToast.loadingClose();
      return null;
    }
  }
}
