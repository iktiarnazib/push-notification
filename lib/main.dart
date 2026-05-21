import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pushnotification/api/firebase_api.dart';
import 'package:pushnotification/pages/home_page.dart';
import 'package:pushnotification/pages/notification_page.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initializeMessage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      navigatorKey: navigatorKey,
      routes: {'notificationScreen': (context) => NotificationPage()},
    );
  }
}
