import 'package:aes_algorithm/config/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /*SvgPicture.asset(
            IconUtils.emptyDataIcon,
            width: HeightUtils.iconSize,
            height: HeightUtils.iconSize,
          ),*/
          SizedBox(height: SpaceUtils.spaceMedium),
          Text('empty_data'.tr),
        ],
      ),
    );
  }
}
