import 'package:aes_algorithm/config/colors.dart';
import 'package:aes_algorithm/config/space.dart';
import 'package:aes_algorithm/config/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String title;
  final bool isRequire;
  final int line;
  final double? width;

  const CustomTextField(
      {required this.controller,
      this.hintText = '',
      Key? key,
      required this.title,
      this.isRequire = false,
      this.line = 1,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width ?? SpaceUtils.spaceMediumLarge,
          child: Text(
            isRequire ? "$title (*)" : title,
            style: StyleUtils.style16Medium,
          ),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            style:
                StyleUtils.style16Medium.copyWith(color: ColorUtils.colorBlack),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 12.0),
              hintText: hintText,
              hintStyle: StyleUtils.style16Medium.copyWith(
                color: ColorUtils.hintTextColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(color: ColorUtils.greyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(color: ColorUtils.primaryColor),
              ),
            ),
            maxLines: line,
            minLines: line,
          ),
        ),
      ],
    );
  }
}
