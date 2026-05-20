import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

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
}
