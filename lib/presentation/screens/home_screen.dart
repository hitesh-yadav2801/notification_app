import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/core/constants/my_colors.dart';
import 'package:notification_app/core/notifications/notification_services.dart';
import 'package:notification_app/presentation/common_widgets/custom_button.dart';
import 'package:notification_app/presentation/common_widgets/my_drawer.dart';
import 'package:notification_app/presentation/screens/second_screen.dart';
import 'package:notification_app/providers/date_provider.dart';
import 'package:provider/provider.dart';

import '../common_widgets/datetime_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SelectedDateProvider selectedDateProvider;

  @override
  void initState() {
    listenToNotifications();
    selectedDateProvider = Provider.of<SelectedDateProvider>(context, listen: false);
    super.initState();
  }

  listenToNotifications() {
    if (kDebugMode) {
      print("Listening to notification");
    }
    NotificationService.onClickNotification.stream.listen((event) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(payload: event),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('H O M E', style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Center(
          child: Column(
            children: [
              // If you want an instant notification click on this button
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

              // Date Picker Button
              DatePickerButton(
                onChanged: (date) {
                  selectedDateProvider.setSelectedDate(date);
                },
              ),

              const SizedBox(height: 15),

              // Selected date and time will be shown here
              Consumer<SelectedDateProvider>(
                builder: (context, provider, child) {
                  if (provider.selectedDate != null) {
                    return Text(
                      '${provider.selectedDate}',
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 10),

              // Scheduled notifications will be shown here
              CustomButton(
                buttonText: "Schedule Notification",
                onPressed: () {
                  if (selectedDateProvider.selectedDate != null) {
                    NotificationService().scheduleNotification(
                      title: 'Scheduled Notification',
                      body: '${selectedDateProvider.selectedDate}',
                      scheduledNotificationDateTime: selectedDateProvider.selectedDate!,
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
