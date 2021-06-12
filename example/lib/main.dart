import 'package:flutter/material.dart';
import 'package:esptouch/ui/shared/globals.dart';
import 'package:esptouch/ui/views/login_view.dart';
import 'package:esptouch/ui/views/connectivity_view.dart';
import 'package:esptouch/ui/views/location_permissions.dart';
import 'package:esptouch/ui/views/test_view.dart';
import 'package:esptouch/ui/views/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  AppComponentState createState() => AppComponentState();
}

class AppComponentState extends State<MyApp> {
  bool isUserActice = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Global.mediumBlue,
        primaryColor: Global.mediumBlue,
      ),
      title: 'AKASHIC',
      initialRoute: isUserActice ? "/home" : "/",
      routes: {
        // '/': (BuildContext context) {
        //   return Scaffold(
        //     appBar: AppBar(
        //       title: const Text('Home Route'),
        //     ),
        //   );
        // },
        // '/about': (BuildContext context) {
        //   return Scaffold(
        //     appBar: AppBar(
        //       title: const Text('About Route'),
        //     ),
        //   );
        // },
        "/": (context) => LoginView(),
        "/home": (context) => UserHome(),
        "/location": (context) => LocationPermission(),
        "/connectivity": (context) => ConnectivityView(),
        "/test": (context) => TestView(),
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
