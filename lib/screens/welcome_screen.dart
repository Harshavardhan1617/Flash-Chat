import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import 'rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcomeScreen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    // height: 60.0,
                    height: controller.value * 100,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                      // fontSize: 45.0,
                      fontSize: controller.value * 50,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              colour: Colors.lightBlueAccent,
              text: 'Login',
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              colour: Colors.blueAccent,
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
