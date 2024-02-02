import 'dart:ui';
import 'package:fetch_product/resources/app_colors.dart';
import 'package:flutter/material.dart';

class MyLoader extends StatefulWidget {
  final Color color;

  const MyLoader({super.key, this.color = Colors.red});

  @override
  MyLoaderState createState() => MyLoaderState();
}

class MyLoaderState extends State<MyLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors().primary.withOpacity(.05),
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child:
              CircularProgressIndicator(backgroundColor: AppColors().primary),
        ),
      ),
    );
  }
}
