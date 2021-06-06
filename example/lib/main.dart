import 'package:flutter/material.dart';
import 'package:esptouch/ui/shared/globals.dart';
import 'package:esptouch/ui/views/login_view.dart';
import 'package:esptouch/ui/views/add_device_view.dart';
import 'package:esptouch/ui/views/connectivity_view.dart';
import 'package:esptouch/ui/views/location_permissions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  AppComponentState createState() => AppComponentState();
}

class AppComponentState extends State<MyApp> {
  bool isUserActice = true;

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
      initialRoute: "/location",
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
        "/": (context) => isUserActice ? AddDeviceView() : LoginView(),
        "/location": (context) => LocationPermission(),
        "/connectivity": (context) => ConnectivityView(),
        // "/regi-info": (context) => RegisterInfoScreen(),
        // "/regi-birth": (context) => RegisterBirthScreen(),
        // "/regi-card": (context) => CardAuthentScreen(),
        // "/regi-shop": (context) => RegisterShopScreen(),
        // "/regi-pass": (context) => RegisterPasswordScreen(),
        // "/regi-mem": (context) => RegisterMemDayScreen(),
        // "/regi-cfin": (context) => RegisterConfirmInfoScreen(),
        // "/regi-comp": (context) => RegisterCompleteScreen(),
        // "/main": (context) => MainContainer(),
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
