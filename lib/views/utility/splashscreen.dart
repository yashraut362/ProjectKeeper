import 'package:flutter/material.dart';
import '../utility/bottomnavbar.dart';
import 'package:splashscreen/splashscreen.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      useLoader: true,
      loaderColor: Theme.of(context).primaryColor,
      loadingText: Text(
        'Please Wait...',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25.0,
        ),
      ),
      seconds: 05,
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
      backgroundColor: Theme.of(context).accentColor,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
    );
  }
}
