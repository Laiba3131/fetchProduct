import 'package:fetch_product/resources/app_colors.dart';
import 'package:fetch_product/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppDecoration {
  InputDecoration fieldDecoration(
      {Widget? preIcon,
      String? hintText,
      Widget? suffixIcon,
      double? radius,
      double? iconMinWidth,
      double? verticalPadding,
      Color? fillColor}) {
    return InputDecoration(
      // verticalPadding
      prefixIconConstraints: BoxConstraints(
        minWidth: iconMinWidth ?? 42,
      ),
      isDense: true,
      fillColor: AppColors().primary.withOpacity(.05),
      filled: true,
      focusColor: AppColors().primary,

      hintText: hintText ?? "Select",
      // contentPadding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 12),
      suffixIcon: suffixIcon != null ? Container(child: suffixIcon) : null,

      hintStyle:
          AppTextStyles().poppinsRegular(fontSize: 11.sp, color: Colors.grey),
      errorStyle: AppTextStyles()
          .poppinsRegular(fontSize: 9.sp, color: AppColors().red),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors().primary),
          borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors().primary),
          borderRadius: BorderRadius.circular(8)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors().red),
          borderRadius: BorderRadius.circular(8)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors().red),
          borderRadius: BorderRadius.circular(8)),
    );
  }

  BoxDecoration decoration({double? radius}) {
    return BoxDecoration(
      color: AppColors().white,
      borderRadius: BorderRadius.circular(radius ?? 8),
      boxShadow: [
        BoxShadow(
          color: AppColors().black.withOpacity(0.1),
          offset: const Offset(-1, -1),
          blurRadius: 6,
        ),
        BoxShadow(
          color: AppColors().black.withOpacity(0.1),
          offset: const Offset(1, 1),
          blurRadius: 6,
        ),
      ],
    );
  }
}
