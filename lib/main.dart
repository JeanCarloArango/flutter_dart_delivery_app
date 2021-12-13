import 'package:delivery_app/services/push_notification_service.dart';
import 'package:delivery_app/ui/bussiness/bussiness_page.dart';
import 'package:delivery_app/ui/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> handleBackground(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  PushNotificationService.initializeApp();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(handleBackground);
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Arvo',
      ),
      initialRoute: "Home",
      routes: {
        "Home": (_) => HomePage(),
        "BussinessPage": (_) => BussinessWidget(),
      },
    );
  }
}
