import 'package:aes_algorithm/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onTap,
    required this.text,
    required this.encrypt,
  }) : super(key: key);

  final Function? onTap;
  final String text;
  final bool encrypt;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: encrypt
            ? BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(30))
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
        child: Center(
          child: encrypt
              ? Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              : Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 18),
                ),
        ),
      ),
    );
  }
}
