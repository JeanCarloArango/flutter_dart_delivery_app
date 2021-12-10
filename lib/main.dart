import 'dart:async';

import 'package:delivery_app/services/push_notification_service.dart';
import 'package:delivery_app/ui/bussiness/bussiness_page.dart';
import 'package:delivery_app/ui/home_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );
  // FirebaseAuth auth = FirebaseAuth.instance;
  await PushNotificationService.initializeApp();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    FirebaseMessaging.instance.getInitialMessage();
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
    super.initState();
  }

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
        "BussinessPage": (_) => BussinessWidget(),
        "Home": (_) => const HomePage(),
      },
    );
  }
}
