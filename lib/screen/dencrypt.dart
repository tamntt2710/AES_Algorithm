import 'package:aes_algorithm/config/styles.dart';
import 'package:aes_algorithm/utils/space.dart';
import 'package:aes_algorithm/widgets/custom_button.dart';
import 'package:aes_algorithm/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class DecryptWidget extends StatefulWidget {
  const DecryptWidget({Key? key}) : super(key: key);

  @override
  _DecryptWidgetState createState() => _DecryptWidgetState();
}

class _DecryptWidgetState extends State<DecryptWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
            controller: TextEditingController(), title: 'Bản mã', line: 4),
        _buildSmallSpace(),
        CustomTextField(
            controller: TextEditingController(), title: 'Khoá', line: 4),
        _buildSmallSpace(),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SpaceUtils.spaceMediumLarge),
          child: CustomButton(
            label: 'Giải mã',
            onTap: () {},
          ),
        ),
        _buildSmallSpace(),
        Text(
          'Kết quả',
          style: StyleUtils.style18Bold,
        ),
        _buildSmallSpace(),
        Row(
          children: [
            SizedBox(
              width: SpaceUtils.spaceMediumLarge,
              child: Text(
                'Thời gian:',
                style: StyleUtils.style16Normal,
              ),
            ),
            Text(
              '20s',
              style: StyleUtils.style16Normal,
            ),
          ],
        ),
        _buildSmallSpace(),
        CustomTextField(
            controller: TextEditingController(), title: 'Bản rõ', line: 4),
      ],
    );
  }

  SizedBox _buildSmallSpace() {
    return SizedBox(
      height: SpaceUtils.spaceSmaller,
    );
  }
}
