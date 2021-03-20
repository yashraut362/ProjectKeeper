import 'package:get/get.dart';
import '../views/utility/bottomnavbar.dart';
import '../views/utility/homepage.dart';
import '../views/utility/splashscreen.dart';
import '../views/learn/learn.dart';
import '../views/projects/projectdetails.dart';

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
