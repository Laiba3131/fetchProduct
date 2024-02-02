import 'package:fetch_product/resources/app_colors.dart';
import 'package:fetch_product/resources/app_text_styles.dart';
import 'package:fetch_product/resources/image_urls.dart';
import 'package:fetch_product/src/auth/vm/auth_vm.dart';
import 'package:fetch_product/utils/custom_widgets/custom_button.dart';
import 'package:fetch_product/utils/hights_widths.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/custom_widgets/textformfiel_widget.dart';

class LoginScreen extends StatefulWidget {
  static String route = "/loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController =
      TextEditingController(/* text: 'luffy@gmail.com' */);
  TextEditingController passwordController =
      TextEditingController(/* text: '12345@' */);

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool ispObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<AuthVM>(builder: (context, vm, _) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 12.sp),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              h7,
              GestureDetector(
                onTap: () {},
                child: Image.asset(AppImages.logo, height: 20.h),
              ),
              h2,
              Text(
                "Login",
                style: AppTextStyles().poppinsBold(
                  color: AppColors().primary,
                  fontSize: 18.sp,
                ),
              ),
              h2,
              CustomTextFormField(
                fieldTitle: "Email",
                controller: emailController,
                hintText: 'Enter email',
                focusNode: emailFocus,
                inputAction: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              CustomTextFormField(
                controller: passwordController,
                focusNode: passwordFocus,
                inputAction: TextInputAction.done,
                inputType: TextInputType.visiblePassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Enter password',
                fieldTitle: "Password",
                obscureText: ispObscure,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      ispObscure = !ispObscure;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.sp),
                    child: Icon(
                      ispObscure
                          ? Icons.visibility_off_rounded
                          : Icons.remove_red_eye_rounded,
                      size: 16.sp,
                    ),
                  ),
                ),
              ),
              h2,
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Forgot Password?",
                        textAlign: TextAlign.center,
                        style: AppTextStyles().poppinsMedium(
                          fontSize: 12.sp,
                          color: AppColors().primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              h1,
              CustomButton(
                buttonTitle: "Login",
                tap: () async {
                  await login(vm);
                },
              ),
            ]),
          ),
        ),
      );
    }));
  }

  Future<void> login(AuthVM vm) async {
    if (_formKey.currentState!.validate()) {
      await context.read<AuthVM>().signIn(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
    }
  }
}
