import 'package:fetch_product/src/auth/view/login_screen.dart';
import 'package:fetch_product/src/auth/view/signup_screen.dart';
import 'package:fetch_product/src/base/view/home_view.dart';
import 'package:fetch_product/src/splash/splash_view.dart';
import 'package:get/route_manager.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: SplashPage.route, page: () => const SplashPage()),
    GetPage(name: LoginScreen.route, page: () => const LoginScreen()),
    GetPage(name: SignupScreen.route, page: () => const SignupScreen()),
    GetPage(name: HomeView.route, page: () => HomeView()),
  ];
}
