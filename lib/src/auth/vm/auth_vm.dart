import 'package:fetch_product/src/auth/view/login_screen.dart';
import 'package:fetch_product/src/base/view/home_view.dart';
import 'package:fetch_product/utils/custom_widgets/toasters.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthVM extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  signupByFirebase(email, password) async {
    try {
      ZBotToast.loadingShow();
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      ZBotToast.loadingClose();
      Get.snackbar('Error', "SignUp Successfully");
      Get.toNamed(LoginScreen.route);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  signInByFirebase(email, password) async {
    try {
      ZBotToast.loadingShow();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      ZBotToast.loadingClose();
      Get.snackbar('Error', "Login Succesfully");
      Get.toNamed(HomeView.route);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void update() {
    notifyListeners();
  }
}
