import 'package:bot_toast/bot_toast.dart';
import 'package:fetch_product/firebase_options.dart';
import 'package:fetch_product/routes/app_routes.dart';
import 'package:fetch_product/src/auth/vm/auth_vm.dart';
import 'package:fetch_product/src/base/vm/base_vm.dart';
import 'package:fetch_product/src/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/base/view/another_multiSelect.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthVM()),
    ChangeNotifierProvider(create: (context) => ProductVM()),
  ], child: const MyApp('Fetch Products')));
}

class MyApp extends StatelessWidget {
  const MyApp(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          title: 'Fetch Products',
          home: MultiSelectExample(),
          // initialRoute: SplashPage.route,
          // getPages: AppPages.pages,
        ),
      );
    });
  }
}
