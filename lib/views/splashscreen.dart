import 'package:flutter/material.dart';
import 'package:projectskeeper/views/bottomnavbar.dart';
import 'package:splashscreen/splashscreen.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      useLoader: true,
      loaderColor: Colors.white,
      loadingText: Text(
        'Please Wait...',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25.0,
        ),
      ),
      seconds: 03,
      navigateAfterSeconds: new BottomNavBar(),
      title: new Text(
        'Project Keeper',
        textAlign: TextAlign.center,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25.0,
        ),
        maxLines: 2,
      ),
      image: new Image.asset("assets/splashscreen/logo.png"),
      backgroundColor: Color(0xff191919),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
    );
  }
}
