import 'package:flutter/material.dart';

import 'package:periyarapp/config.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0.0),
            // child: Image.asset(
            //   "assets/logo_tr_2.jpg",
            //   fit: BoxFit.contain,
            // ),
            child: Center(
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
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.qr_code_2,
          //   ),
          //   title: Text("Scan Tickets"),
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.app_registration,
          //   ),
          //   title: Text("Previous Bookings"),
          // ),
          ListTile(
            onTap: () {
              // context.read<ProgramsBloc>().add(
              //       DoLogout(context: context),
              //     );
            },
            leading: const Icon(
              Icons.logout,
            ),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
