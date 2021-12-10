import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static String? token;

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await messaging.getToken();
    print(token);
  }

  static getNotifications(BuildContext context) async {
    await FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen(
      (message) {
        if (message.notification != null) {
          print(message.notification!.body);
          print(message.notification!.title);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (messagge) {
        final routeMessagge = messagge.data["route"];
        print(routeMessagge);
        Navigator.of(context).pushNamed(routeMessagge);
      },
    );
  }

}
