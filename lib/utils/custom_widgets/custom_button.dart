import 'package:fetch_product/resources/app_colors.dart';
import 'package:fetch_product/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback? tap;
  final Color? color;
  final Color? textColor;
  final Color? borderCOlor;
  final double? paddingVertical;
  final double? paddingHorizontal;
  const CustomButton(
      {super.key,
      required this.buttonTitle,
      required this.tap,
      this.color,
      this.textColor,
      this.paddingVertical = 9,
      this.paddingHorizontal = 8,
      this.borderCOlor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: tap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            vertical: paddingVertical!.sp, horizontal: paddingHorizontal!.sp)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundColor:
            MaterialStateProperty.all(color ?? AppColors().primary),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonTitle,
            style: AppTextStyles().poppinsMedium().copyWith(
                color: textColor ?? AppColors().white, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

class CustomButtonSearchView extends StatelessWidget {
  final String text;
  final Color textCol;
  final VoidCallback? tap;
  const CustomButtonSearchView(
      {super.key,
      required this.text,
      required this.textCol,
      required this.tap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: tap,
        child: Container(
          height: 45,
          width: 120,
          decoration: BoxDecoration(
              color: AppColors().primary,
              borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(
            text,
            style: AppTextStyles().poppinsRegular().copyWith(color: textCol),
          )),
        ),
      ),
    );
  }
}
