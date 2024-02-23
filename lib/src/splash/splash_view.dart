import 'package:fetch_product/src/auth/view/login_screen.dart';
import 'package:fetch_product/src/auth/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  static String route = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //final controller = Get.put(SplashController());
  @override
  void initState() {
    onReady(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShPx9HXwUkMGVG2fhKjaiuHJOfx7WVcTPoRg&usqp=CAU')),
    );
  }

  Future<void> onReady(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(LoginScreen.route);
  }
}
