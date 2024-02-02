import 'package:bot_toast/bot_toast.dart';
import 'package:fetch_product/utils/custom_widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ZBotToast {
  static loadingShow() async {
    BotToast.showCustomLoading(
        toastBuilder: (func) {
          return const MyLoader();
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

  static showToastSuccess(
      {@required String? message, Duration? duration}) async {
    await loadingClose();

    BotToast.showCustomText(
        toastBuilder: (func) {
          return Column(
            children: [
              const Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.w),
                decoration: BoxDecoration(
                    color: const Color(0xff85BB65),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.white),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
        clickClose: true,
        crossPage: true,
        align: Alignment.bottomRight,
        animationReverseDuration: const Duration(seconds: 1),
        animationDuration: const Duration(seconds: 1),
        duration: duration ?? const Duration(seconds: 3));
  }
}
