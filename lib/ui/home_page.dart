import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/common/menu_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (message != null) {
          final routeMessagge = message.data["route"];
          Navigator.of(context).pushNamed(routeMessagge);
        }
      },
    );

    FirebaseMessaging.onMessage.listen(
      (message) {
        if (message.notification != null) {
          print(message.notification!.body);
          print(message.notification!.title);
        }
        // LocalNotificationsService.display(message);
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        final routeMessagge = message.data["route"];
        Navigator.of(context).pushNamed(routeMessagge);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AutoSizeText(
          'Menu Principal',
          maxLines: 1,
          maxFontSize: 25,
          minFontSize: 10,
        ),
      ),
      drawer: MenuWidget(),
      body: Stack(
        children: [
          Positioned.fill(
            child: FittedBox(
              child: Image.asset('assets/welcome.gif'),
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
