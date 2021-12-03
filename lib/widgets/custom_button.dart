import 'package:aes_algorithm/config/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? icon;
  final String label;
  final VoidCallback? onTap;
  final Color bgColor;
  final double height;
  const CustomButton({
    required this.label,
    this.onTap,
    this.icon,
    this.bgColor = Colors.blue,
    this.height = 38.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Material(
        color: bgColor,
        borderRadius: BorderRadius.circular(4.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? SizedBox(),
                if (icon != null) SizedBox(width: 12.0),
                Text(
                  label,
                  style: StyleUtils.style16Normal.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
