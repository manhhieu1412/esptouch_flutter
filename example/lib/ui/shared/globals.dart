import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

class Global {
  static const Color white = const Color(0xffffffff);
  static const Color mediumBlue = Colors.blue;
  static const List validEmail = ['test@gmail.com'];
}

class Config {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static Future<Tuple2<String, String>?> getWifiPassword() async {
    final SharedPreferences prefs = await _prefs;
    final ssid = prefs.getString('wifi-ssid');
    final pass = prefs.getString('wifi-password');
    if (ssid != null && pass != null) {
      return Tuple2(ssid, pass);
    } else {
      return null;
    }
  }

  static void setWifiInfo(String ssid, String password) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('wifi-ssid', ssid);
    prefs.setString('wifi-password', password);
  }
}
