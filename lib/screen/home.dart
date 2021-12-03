import 'package:aes_algorithm/config/space.dart';
import 'package:aes_algorithm/config/styles.dart';
import 'package:aes_algorithm/screen/encrypt.dart';
import 'package:aes_algorithm/utils/colors.dart';
import 'package:aes_algorithm/widgets/custom_button.dart';
import 'package:aes_algorithm/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

import 'dencrypt.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String encryptBit = "Khoá 128 bit";

  final List<String> bitList = ["Khoá 128 bit", "Khoá 192 bit", "Khoá 256 bit"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: SpaceUtils.spaceLarge),
        child: Column(
          children: [
            _buildEncryptBitRadioGroup(),
            Row(
              children: [
                const Expanded(child: EncryptWidget()),
                Container(
                  width: 100,
                  color: ColorUtils.blackColor,
                ),
                const Expanded(child: DecryptWidget()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column _buildEncrypt() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
            controller: TextEditingController(), title: 'Bản rõ', line: 4),
        _buildSmallSpace(),
        CustomTextField(
            controller: TextEditingController(), title: 'Khoá', line: 4),
        _buildSmallSpace(),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SpaceUtils.spaceMediumLarge),
          child: CustomButton(
            label: 'Mã hoá',
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
            controller: TextEditingController(), title: 'Bản mã', line: 4),
      ],
    );
  }

  SizedBox _buildSmallSpace() {
    return SizedBox(
      height: SpaceUtils.spaceSmaller,
    );
  }

  Padding _buildEncryptBitRadioGroup() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SpaceUtils.spaceMediumLarge),
      child: RadioGroup<String>.builder(
        horizontalAlignment: MainAxisAlignment.start,
        groupValue: encryptBit,
        direction: Axis.horizontal,
        onChanged: (value) => setState(() {
          encryptBit = value!;
        }),
        items: bitList,
        itemBuilder: (item) => RadioButtonBuilder(
          item,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Advanced Encryption Standard Tool',
            style: StyleUtils.style18Bold.copyWith(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: ColorUtils.primaryColor,
    );
  }
}
