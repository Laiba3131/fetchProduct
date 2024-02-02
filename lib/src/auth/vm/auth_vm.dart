import 'package:fetch_product/services/auth_services.dart';
import 'package:fetch_product/src/auth/model/user_model.dart';
import 'package:fetch_product/src/auth/view/login_screen.dart';
import 'package:fetch_product/utils/custom_widgets/toasters.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthVM extends ChangeNotifier {
  final BaseAuth _auth = Auth();
  UserModel userModel = UserModel();

  Future<bool> signUp(UserModel? ud, {required String pass}) async {
    bool result = false;
    try {
      ZBotToast.loadingShow();
      debugPrint('${ud!.email},${ud.name},$pass');
      _auth.createUserWithEmailPassword(ud.email ?? "", pass);

      Get.offAllNamed(LoginScreen.route);

      ZBotToast.loadingClose();
      result = true;
      notifyListeners();
    } catch (e) {
      ZBotToast.loadingClose();
    }
    return result;
  }

  Future<void> signIn(String email, String pass) async {
    try {
      ZBotToast.loadingShow();
      _auth.signInWithEmailPassword(email, pass);
      ZBotToast.loadingClose();
      notifyListeners();
    } catch (e) {
      String error = e.toString().split(']').toList().last;
      debugPrint("userModel $error SOmething is incorrect");
      ZBotToast.loadingClose();
    }
  }

  void update() {
    notifyListeners();
  }
}
