import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectskeeper/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      getPages: Routers.route,
      initialRoute: '/navbar',
      theme: ThemeData(
        primaryColor: Color(0xffFFE30A),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
