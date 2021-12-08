import 'package:aes_algorithm/common/constant.dart';
import 'package:flutter/material.dart';

class RadioButtonGroup extends StatefulWidget {
  const RadioButtonGroup({
    Key? key,
    required this.onChanged,
    required this.items,
    this.initialIndex = 0,
  }) : super(key: key);

  final Function(int? index,String? value) onChanged;
  final List<String> items;
  final int initialIndex;

  @override
  State<RadioButtonGroup> createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  late int _selected = 0;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.items.isEmpty
          ? [SizedBox()]
          : widget.items
          .map(
            (e) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomRadio(
                value: widget.items.indexOf(e),
                groupValue: _selected,
                onChanged: (index) {
                  widget.onChanged(index, widget.items[index]);
                  _selected = index;
                  setState(() {});
                }),
            Text(
              e,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      )
          .toList(),
    );
  }
}

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final void Function(int) onChanged;

  const CustomRadio(
      {Key? key,
        required this.value,
        required this.groupValue,
        required this.onChanged})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => selected ? null : widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(
          Icons.circle,
          size: 12,
          color: selected ? kPrimaryColor : Colors.white,
        ),
      ),
    );
  }
}
