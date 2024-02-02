import 'package:fetch_product/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  TextStyle poppinsRegular({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 11.sp,
      color: color ?? AppColors().black,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing ?? 0,
    );
  }

  TextStyle poppinsBold({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 12.sp,
      color: color ?? AppColors().black,
      fontWeight: fontWeight ?? FontWeight.bold,
      letterSpacing: letterSpacing ?? 0,
    );
  }

  TextStyle poppinsMedium({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 12.sp,
      color: color ?? AppColors().black,
      fontWeight: fontWeight ?? FontWeight.w500,
      letterSpacing: letterSpacing ?? 0,
    );
  }
}
