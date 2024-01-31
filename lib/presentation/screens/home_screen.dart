import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_app/core/constants/my_colors.dart';
import 'package:notification_app/core/notifications/notification_services.dart';
import 'package:notification_app/presentation/common_widgets/custom_button.dart';
import 'package:notification_app/presentation/common_widgets/my_drawer.dart';
import 'package:notification_app/presentation/screens/second_screen.dart';

import '../common_widgets/datetime_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDateTime;
  final _selectedDateTimeController = StreamController<DateTime?>();

  @override
  void initState() {
    NotificationService().initNotification(context);
    listenToNotifications();
    super.initState();
  }
  listenToNotifications() {
    print("Listening to notification");
    NotificationService.onClickNotification.stream.listen((event) {
      print(event);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(payload: event),
        ),
      );
    });
  }


  @override
  void dispose() {
    _selectedDateTimeController.close();
    super.dispose();
  }

  void handleDateSelected(DateTime date) {
    setState(() {
      selectedDateTime = date;
      print('Date selected: ' + selectedDateTime.toString());
      _selectedDateTimeController.add(selectedDateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('H O M E', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Center(
          child: Column(
            children: [
              CustomButton(
                buttonText: "Instant Notification",
                onPressed: () {
                  NotificationService().showNotification(
                    title: 'Notification Title',
                    body: 'Notification Body',
                  );
                },
              ),
              const SizedBox(height: 40),

              DatePickerButton(
                onChanged: handleDateSelected,
              ),

              const SizedBox(height: 15),

              StreamBuilder<DateTime?>(
                stream: _selectedDateTimeController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data}',
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 10),

              CustomButton(
                buttonText: "Schedule Notification",
                onPressed: () {
                  if (selectedDateTime != null) {
                    NotificationService().scheduleNotification(
                      title: 'Scheduled Notification',
                      body: '${selectedDateTime}',
                      scheduledNotificationDateTime: selectedDateTime!,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Notification Scheduled'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
