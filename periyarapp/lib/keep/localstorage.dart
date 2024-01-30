import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static saveToken(var token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static saveRole(var role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
  }

  static getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  static saveFamId(var famid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('famid', famid);
  }

  static getFamId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('famid');
  }

  static setISfirsttime(bool isFirstTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', isFirstTime);
  }

  static getIsFirsttime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isFirstTime') != null) {
      return prefs.getBool('isFirstTime');
    } else {
      return false;
    }
  }

  static saveFcmToken(String fcmToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcmToken', fcmToken);
    log(fcmToken);
    // final sharedPreferences = await Helper.locaStorageInst();
    // sharedPreferences.setString('fcmToken', fcmToken);
  }

  static getFcmToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('fcmToken');
    return data;

    // final sharedPreferences = await Helper.locaStorageInst();
    // return sharedPreferences.getString('fcmToken');
  }

  static clearAll() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
