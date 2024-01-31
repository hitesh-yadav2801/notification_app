import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:notification_app/core/constants/my_colors.dart';

class DatePickerButton extends StatefulWidget {
  final void Function(DateTime date) onChanged;

  const DatePickerButton({
    Key? key,
    required this.onChanged,
  }) : super(key: key);


  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  DateTime scheduleTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          onChanged: (widget.onChanged),
          onConfirm: (date) {}, // Consider implementing if needed
        );
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: MyColors.yellowColor,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        side: const BorderSide(color: MyColors.yellowColor),
      ),
      child: const Text('Select Date & Time'),
    );
  }
}
