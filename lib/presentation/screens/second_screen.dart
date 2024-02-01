import 'package:flutter/material.dart';
import 'package:notification_app/core/constants/my_colors.dart';

class SecondScreen extends StatefulWidget {
  final String? payload;

  const SecondScreen({Key? key, this.payload})
      : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text("Notification Details"),
      ),
      body: Center(child: Text(widget.payload!, style: const TextStyle(fontSize: 20),)),
    );
  }
}
