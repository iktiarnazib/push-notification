import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pushnotification/main.dart';
import 'package:pushnotification/pages/notification_page.dart';

class FirebaseApi {
  //create a firebase instance
  final firebaseMessaging = FirebaseMessaging.instance;

  //request notification permission and get the device token
  Future<void> initializeMessage() async {
    //get permission of firebaseMessaging from user
    await firebaseMessaging.requestPermission();
    final fCMToken = await firebaseMessaging.getToken();

    //print user token
    print("token: ${fCMToken}");
  }

  //Funciton to handle received message
  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }

    navigatorKey.currentState?.pushNamed(
      'notificationScreen',
      arguments: message,
    );
  }

  //Function to initialize background settings
  Future initPushNotification() async {
    //handle notification if the app was terminated and now opened
    firebaseMessaging.getInitialMessage().then(handleMessage);

    //attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
