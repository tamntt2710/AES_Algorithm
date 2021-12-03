import 'package:aes_algorithm/config/styles.dart';
import 'package:aes_algorithm/utils/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomBottomDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final List<Widget>? actions;
  final Widget? cancelButton;

  const CustomBottomDialog({
    Key? key,
    this.title,
    this.message,
    this.actions,
    this.cancelButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SpaceUtils.spaceMedium, vertical: SpaceUtils.spaceLarge),
      child: CupertinoActionSheet(
        title: (title == null)
            ? null
            : Text(
                title!,
                style: StyleUtils.style18Bold,
              ),
        message: (message == null)
            ? null
            : Text(
                message!,
                style: StyleUtils.style16Medium,
              ),
        actions: actions,
        cancelButton: cancelButton ??
            CupertinoActionSheetAction(
              child: Container(
                child: Text(
                  "cancel".tr,
                  style: StyleUtils.style18Normal,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      ),
    );
  }
}
