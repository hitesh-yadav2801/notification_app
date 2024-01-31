// // routes.dart
//
// import 'package:flutter/material.dart';
// import 'package:notification_app/presentation/home_screen.dart';
// import 'package:notification_app/presentation/screens/second_screen.dart';
//
// class Routes {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final args = settings.arguments;
//
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => HomeScreen());
//
//       case '/notification_details':
//         if (args is String) {
//           return MaterialPageRoute(
//             builder: (_) => NotificationDetails(payload: args),
//           );
//         }
//     // Handle other cases if needed
//
//       default:
//       // Handle unknown routes or navigate to a default screen
//         return MaterialPageRoute(builder: (_) => HomeScreen());
//     }
//   }
// }
