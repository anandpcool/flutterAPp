import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iboss_flutter/services/remote_service.dart';
import 'package:iboss_flutter/utils/user_simple_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  String userName = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Material(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 60)),
                    Image.asset(
                      "assets/images/icon_app_logo.png",
                      fit: BoxFit.cover,
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          border: OutlineInputBorder(),
                          hintText: "Enter Username",
                          labelText: "User Name",
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          userName = value;
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          border: OutlineInputBorder(),
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Password can't be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(fontSize: 16.0),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            moveToHome(context);
                            //Navigator.pushNamed(context, "/otp");
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'OR',
                                style: TextStyle(fontSize: 14.0),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: TextButton(
                              onPressed: () {
                                //moveToHome(context);
                                Navigator.pushNamed(context, "/otp");
                              },
                              child: const Text(
                                'LOGIN  WITH  OTP',
                                textScaleFactor: 1.2,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          "assets/images/icon_hero.png",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      callLoginApi();
      //Navigator.pushNamed(context, "/otp");

    }
  }

// create function to call login API

  FutureOr<void> callLoginApi() async {
    if (userName.isNotEmpty && password.isNotEmpty) {
      //show snackbar to indicate loading
      /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));*/

      Map<String, String> map = HashMap();
      map["Username"] = userName;
      map["Password"] = password;

      final RemoteService _apiClient = RemoteService();
      dynamic dataResponse = await _apiClient.loginApi(map, context);
      var jsonData = json.decode(dataResponse);

      //ScaffoldMessenger.of(context).hideCurrentSnackBar();
      print(jsonData["token"]);

      if (jsonData["token"] != "Invalid User Credentials...") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Success: ${jsonData["token"]}'),
          backgroundColor: Colors.green.shade300,
        ));
        setState(() {
          _validate = true;
        });
        await UserSimplePreferences.setLoggedIn(true);
        await UserSimplePreferences.setToken(jsonData["token"]);

        Navigator.pushNamed(context, "/home");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${jsonData["token"]}'),
          backgroundColor: Colors.red.shade300,
        ));
        setState(() {
          _validate = false;
        });
      }

      /*if (response.statusCode == 200)
      {
        var jsonData = json.decode(response.body);
        print(jsonData);
        setState(() {
          _validate = true;
        });
        Navigator.pushNamed(context, "/otp");
      } else {
        setState(() {
          _validate = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Invalid credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid")));
    }*/
    }
  }
}
