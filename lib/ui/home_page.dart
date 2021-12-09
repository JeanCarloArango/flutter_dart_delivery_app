import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_app/ui/common/menu_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
