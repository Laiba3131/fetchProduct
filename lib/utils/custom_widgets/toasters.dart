import 'package:bot_toast/bot_toast.dart';
import 'package:fetch_product/resources/app_colors.dart';
import 'package:flutter/material.dart';

class ZBotToast {
  static loadingShow() async {
    BotToast.showCustomLoading(
        toastBuilder: (func) {
          return CircularProgressIndicator(
              backgroundColor: AppColors().primary);
        },
        allowClick: false,
        clickClose: false,
        backgroundColor: Colors.transparent);
    Future.delayed(const Duration(seconds: 60), () => loadingClose());
  }

  static Future loadingClose() async {
    BotToast.cleanAll();
    await Future.delayed(const Duration(milliseconds: 60));
  }
}
