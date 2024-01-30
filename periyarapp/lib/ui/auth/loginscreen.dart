import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:periyarapp/bloc/mainbloc.dart';
import 'package:periyarapp/config.dart';
import 'package:periyarapp/helper/helper.dart';
import 'package:periyarapp/ui/homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool isStarted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bgptrr.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 60.0,
              ),
              Text(
                "P E R I Y A R",
                style: StyleElements.heading,
              ),
              Text(
                "TIGER RESERVE",
                style: StyleElements.subheading,
              ),
              const Spacer(),
              _formData(),
            ],
          ),
        ),
      ),
    );
  }

  _formData() {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: _formKey,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 20.0,
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Please Login to Continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Username",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: phoneNumberController,
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Enter Mobile Number/Email";
                  }
                  return null;
                },
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                autofocus: true,
                decoration: const InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.white,
                  labelText: "Mobile Number/Email",
                  labelStyle: TextStyle(fontSize: 14.0, color: Colors.black),
                  filled: true,
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Password",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: true,
                obscureText: _obscureText,
                style: const TextStyle(color: Colors.black),
                controller: passwordController,
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Enter Password";
                  }
                  return null;
                },
                cursorColor: Colors.black,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  errorStyle: const TextStyle(color: Colors.white),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.white,
                  labelText: "Password",
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _obscureText == false
                            ? _obscureText = true
                            : _obscureText = false;
                      });
                    },
                    child: Icon(
                      _obscureText == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  labelStyle:
                      const TextStyle(fontSize: 14.0, color: Colors.black),
                  filled: true,
                ),
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Fluttertoast.showToast(msg: "Will work soon.");
                      },
                      child: const Text("Forgot Password ?")),
                ],
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                height: 48.0,
                child: TextButton(
                  style: StyleElements.submitButtonStyle,
                  onPressed: () async {
                    BlocProvider.of<MainBloc>(context).add(VerifyPassword(
                      name: phoneNumberController.text.trim(),
                      password: passwordController.text.trim(),
                    ));
                    ////
                  },
                  child: BlocConsumer<MainBloc, MainState>(
                      builder: (context, state) {
                    if (state is Employeelogin) {
                      return const SizedBox(
                        height: 18.0,
                        width: 18.0,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                          strokeWidth: 2,
                        ),
                      );
                    } else {
                      return Text("Signin",
                          style: StyleElements.buttonTextStyleBold);
                    }
                  }, listener: (context, state) {
                    if (state is Employeeloginsuccess) {
                      //  Helper.pushReplacement(context, HomeScreen);
                    } else if (state is ProductionUnitsuccess) {
                      //  Helper.pushReplacement(context, HomeScreen);
                    } else if (state is IBsuccess) {
                      //  Helper.pushReplacement(context, HomeScreen);
                    } else if (state is Ecoshopsuccess) {
                      //  Helper.pushReplacement(context, HomeScreen);
                    } else if (state is Stayssuccess) {
                      //  Helper.pushReplacement(context, HomeScreen);
                    } else if (state is EmployeeloginError) {
                      Fluttertoast.showToast(
                          backgroundColor: Colors.white,
                          msg: state.error.toString(),
                          textColor: Colors.black);
                    } else if (state is CheckPostSuccess) {
                      //  Helper.pushReplacement(context, HomeScreen);
                    } else if (state is ReceptionSuccess) {
                      Helper.pushReplacement(context, const SpotBookingHome());
                    }

                    //  else {/
                    //   Navigator.pushReplacement(context,
                    //       MaterialPageRoute(builder: (context) => HomePage()));
                    // }
                  }),
                ),
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "version 1.0.0",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
