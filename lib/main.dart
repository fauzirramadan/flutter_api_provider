import 'package:flutter/material.dart';

import 'package:flutter_api_provider/views/my_tabbar.dart';

void main() {
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navKey = GlobalKey();
GlobalKey<ScaffoldMessengerState> notifKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      scaffoldMessengerKey: notifKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyTabBar(),
    );
  }
}
