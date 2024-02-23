// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:io';
import 'package:fetch_product/resources/app_colors.dart';
import 'package:fetch_product/resources/app_text_styles.dart';
import 'package:fetch_product/src/auth/vm/auth_vm.dart';
import 'package:fetch_product/utils/custom_widgets/custom_button.dart';
import 'package:fetch_product/utils/hights_widths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/custom_widgets/textformfiel_widget.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  static String route = "/signupScreen";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  showSnackBar(context, text) {
    var snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar((snackBar));
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmpasswordFocus = FocusNode();
  FocusNode nameFocus = FocusNode();

  bool isObscure1 = false;
  bool isObscure2 = false;
  bool isChecked = false;

  TextEditingController phoneNumberController = TextEditingController();
  FocusNode numberFN = FocusNode();

  DateTime? currentBackPressTime;

  File? profileImage;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.offAllNamed(LoginScreen.route);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    // return Consumer2<AuthVM, RootProvider>(builder: (context, authVm, vm, _) {

    return WillPopScope(
      onWillPop: () async => await onWillPop(),
      child: SafeArea(
        child: Consumer<AuthVM>(builder: (context, vm, _) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.offAllNamed(LoginScreen.route);
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: Text(
                'Signup',
                style: AppTextStyles().poppinsMedium(),
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 12.sp),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    h3,
                    CustomTextFormField(
                      fieldTitle: "Full Name",
                      controller: nameController,
                      hintText: 'Enter name',
                      focusNode: nameFocus,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    CustomTextFormField(
                      fieldTitle: "Email",
                      controller: emailController,
                      hintText: 'Enter email',
                      focusNode: emailFocus,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    h1,
                    CustomTextFormField(
                      controller: passwordController,
                      focusNode: passwordFocus,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hintText: 'Enter password',
                      fieldTitle: "Password",
                      obscureText: isObscure1,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure1 = !isObscure1;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.sp),
                          child: Icon(
                            isObscure1
                                ? Icons.visibility_off_rounded
                                : Icons.remove_red_eye_rounded,
                            color: Colors.grey,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    h1,
                    CustomTextFormField(
                      controller: confirmpasswordController,
                      focusNode: confirmpasswordFocus,
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hintText: 'Enter confirm password',
                      fieldTitle: "Confirm Password",
                      obscureText: isObscure2,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure2 = !isObscure2;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.sp),
                          child: Icon(
                            isObscure2
                                ? Icons.visibility_off_rounded
                                : Icons.remove_red_eye_rounded,
                            color: Colors.grey,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    h1,
                    CustomButton(
                      buttonTitle: "Sign up",
                      tap: () async {
                        await vm.signupByFirebase(
                            emailController.text.toString(),
                            passwordController.text.toString());
                      },
                    ),
                    h1,
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(bottom: 8.sp),
              child: authBottomWidget(
                "Already have an account?",
                '  LogIn',
                () => Get.offAllNamed(LoginScreen.route),
              ),
            ),
          );
        }),
      ),
    );
  }

  static Widget authBottomWidget(
      String firstTxt, String scndTxt, Function() onTap) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            firstTxt,
            style: AppTextStyles()
                .poppinsMedium(fontSize: 10.sp, color: Colors.black),
          ),
          Text(
            scndTxt,
            style: AppTextStyles().poppinsMedium(
                fontSize: 12.sp,
                color: AppColors().primary,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
