import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delivery_app/ui/common/menu_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConnectivityResult res = ConnectivityResult.none;
  bool connected = false;
  bool hasInternet = false;

  void checkConnection() async {
    res = await Connectivity().checkConnectivity();

    if (res == ConnectivityResult.wifi || res == ConnectivityResult.mobile) {
      connected = true;
    } else {
      connected = false;
    }
  }

  @override
  void initState() {
    super.initState();

    checkConnection();
    InternetConnectionChecker().onStatusChange.listen(
      (status) {
        final hasInternet = status == InternetConnectionStatus.connected;
        setState(() {
          checkConnection();
          this.hasInternet = hasInternet;
        });
      },
    );

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
    return connected
        ? Scaffold(
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
          )
        : Scaffold(
            body: Center(
              child: AutoSizeText(
                'Conectate a una red (WI-FI / MOVIL)',
                style: TextStyle(fontSize: 20),
                maxFontSize: 20,
                minFontSize: 15,
                maxLines: 1,
              ),
            ),
          );
  }
}
