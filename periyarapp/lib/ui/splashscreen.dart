import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:periyarapp/config.dart';
import 'package:periyarapp/helper/helper.dart';
import 'package:periyarapp/keep/localstorage.dart';
import 'package:periyarapp/ui/auth/loginscreen.dart';
import 'package:periyarapp/ui/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Timer(
      const Duration(seconds: 3),
      () => fetcher(),
    );
  }

////added for assets
  Future<void> fetcher() async {
    String? role = await LocalStorage.getRole();
    String? token = await LocalStorage.getToken();

    if (token != null) {
      if (role == "Ecoshop") {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => EchoShopBottomNavigation()));
      } else if (role == "Ic") {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => CustomerBottomNavigation()));
      } else if (role == "Production unit") {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => UnitsAssetsBottomNavigation()));
      } else if (role == "Ib") {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => UnitsAssetsBottomNavigation()));
        // MaterialPageRoute(builder: (context) => const IBHomePage()));
      } else if (role == "Stays") {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => const StaysHomePage()));
      } else if (role == "Reception") {
        // bool isConnected = await Helper.checkInternet(context);
        if (mounted) {
          Helper.pushReplacement(context, const SpotBookingHome());
        }
      } else if (role == "Entry Point") {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => EntryHomePage()));
        //  Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => TestEntryHomePage()));
      } else {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => UnitsAssetsBottomNavigation()));
      }
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen())));
    }
  }
  // @override
  // void dispose() {
  //   super.dispose();
  //   streamSubscription.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bgptrr.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 100,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "PERIYAR",
                    style: StyleElements.heading,
                  ),
                  Text(
                    "TIGER RESERVE",
                    style: StyleElements.subheading,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: HexColor("#68D389"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
