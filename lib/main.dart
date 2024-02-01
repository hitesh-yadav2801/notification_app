import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_app/core/notifications/notification_services.dart';
import 'package:notification_app/core/routes/my_routes.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'presentation/screens/home_screen.dart';
import 'providers/date_provider.dart';
import 'providers/threme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService notificationService = NotificationService();
  notificationService.initNotification();
  tz.initializeTimeZones();

  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
      await notificationService.notificationsPlugin.getNotificationAppLaunchDetails();

  String initialRoute = MyRoutes.homeScreen;

  if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    NotificationService.onNotificationTapBackground(notificationAppLaunchDetails!.notificationResponse!);
    initialRoute = MyRoutes.secondScreen;
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SelectedDateProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: NotificationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomeScreen(),
    );
  }
}

