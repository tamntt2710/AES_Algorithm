import 'package:aes_algorithm/config/colors.dart';
import 'package:aes_algorithm/config/space.dart';
import 'package:aes_algorithm/config/styles.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String message;
  final String? title;
  final Widget? leftActionWidget;
  final Widget rightActionWidget;

  const CustomAlertDialog(
      {Key? key,
      required this.message,
      this.title,
      this.leftActionWidget,
      required this.rightActionWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(SpaceUtils.spaceMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (title != null)
                  Container(
                    child: Center(
                      child: Text(
                        title!,
                        style: StyleUtils.style18Bold
                            .copyWith(color: ColorUtils.blackColor),
                      ),
                    ),
                  ),
                SizedBox(
                  height: SpaceUtils.spaceSmall,
                ),
                Container(
                  child: Center(
                    child: Text(
                      message,
                      style: StyleUtils.style16Normal
                          .copyWith(color: ColorUtils.blackColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            if (leftActionWidget != null)
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                  child: leftActionWidget,
                ),
              ),
            Expanded(
              flex: 1,
              child: rightActionWidget,
            ),
          ],
        ),
      ],
    );
  }
}
