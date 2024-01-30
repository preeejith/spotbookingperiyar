import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:periyarapp/bloc/mainbloc.dart';
import 'package:periyarapp/config.dart';
import 'package:periyarapp/ui/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(create: (BuildContext context) => MainBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Periyar Tiger Reserve',
        color: AppColors.appColor,
        theme: ThemeData(
          primaryColor: HexColor("#53A874"),
          scaffoldBackgroundColor: HexColor("#1F1F1F"),
          fontFamily: "Sofia Pro",
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            backgroundColor: HexColor("#141414"),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            titleTextStyle: TextStyle(
              fontFamily: "Sofia Pro",
              color: HexColor("#FFFFFF"),
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
            centerTitle: false,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
