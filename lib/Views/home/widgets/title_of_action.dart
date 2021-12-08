import 'package:aes_algorithm/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleOfAction extends StatelessWidget {
  const TitleOfAction({
    Key? key,
    required this.title,
    this.textColor = kPrimaryColor,
  }) : super(key: key);

  final String title;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
      margin: EdgeInsets.only(top: 50.h),
      child: Text(title,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
              wordSpacing: 3)),
    );
  }
}
