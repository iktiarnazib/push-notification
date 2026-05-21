import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pushnotification/main.dart';

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
    //Initialize further settings for push notification
    initPushNotification();
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
    //app is terminated, then reopens with this
    await firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        return handleMessage(message);
      }
    });

    //app is sleeping, on notification incoming it opens.
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
