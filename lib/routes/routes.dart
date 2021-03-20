import 'package:get/get.dart';
import 'package:projectskeeper/views/bottomnavbar.dart';
import 'package:projectskeeper/views/homepage.dart';
import 'package:projectskeeper/views/learn.dart';
import 'package:projectskeeper/views/projectdetails.dart';
import 'package:projectskeeper/views/splashscreen.dart';

class Routers {
  static final route = [
    GetPage(
      name: '/splashscreen',
      page: () => Splashscreen(),
    ),
    GetPage(
      name: '/homepage',
      page: () => Homepage(),
    ),
    GetPage(
      name: '/projectdetails',
      page: () => ProjectDetails(),
    ),
    GetPage(
      name: '/learn',
      page: () => Learn(),
    ),
    GetPage(
      name: '/navbar',
      page: () => BottomNavBar(),
    ),
  ];
}
