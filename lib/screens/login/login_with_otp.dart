import 'package:flutter/material.dart';

class LoginWithOtp extends StatefulWidget {
  @override
  State<LoginWithOtp> createState() => _LoginWithOtpState();
}

class _LoginWithOtpState extends State<LoginWithOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Material(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 80)),
                  Image.asset(
                    "assets/images/icon_app_logo.png",
                    fit: BoxFit.cover,
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter OTP",
                        labelText: "OTP",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text(
                          'Login with otp'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              wordSpacing: 4.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'OR',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
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
                              Navigator.pushNamed(context, "/login");
                            },
                            child: const Text(
                              'LOGIN WITH USER NAME',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 4.0),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        "assets/images/icon_hero.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
