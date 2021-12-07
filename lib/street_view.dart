import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Street View Example'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text("Street View Panorama init"),
              subtitle: Text("An example of street view init."),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StreetViewPanoramaInitDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StreetViewPanoramaInitDemo extends StatelessWidget {
  StreetViewController? streetViewController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Street View Init Demo'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              FlutterGoogleStreetView(
                  initPos: LatLng(25.0780892, 121.5753234),
                  onStreetViewCreated: (StreetViewController controller) async {
                    //save controller for late using
                    streetViewController = controller;
                    //change position by controller
                    controller.setPosition(
                        position: LatLng(37.769263, -122.450727));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
