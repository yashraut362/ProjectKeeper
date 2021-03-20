// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:projectskeeper/views/homepage.dart';
// import 'package:projectskeeper/views/learn.dart';
// import 'package:projectskeeper/views/maps.dart';

// class BottomNavBar extends StatelessWidget {
//   final List children = [
//     Maps(),
//     Homepage(),
//     Learn(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Obx(() {
//       return Scaffold(
//         body: children[navbarController.navbarModel.value.currentIndex],
//         bottomNavigationBar: BottomNavyBar(
//           containerHeight: size.height * 0.08,
//           selectedIndex: _currentIndex,
//           onItemSelected: (index) {
//             setState(() => _currentIndex = index);
//             _pageController.jumpToPage(index);
//           },
//           showElevation: true,
//           itemCornerRadius: 12,
//           onItemSelected: (index) {
//             navbarController.onItemSelect(index);
//           },
//           items: [
//             BottomNavyBarItem(
//               icon: Icon(
//                 Icons.map,
//                 color: Colors.black,
//                 size: size.width * 0.07,
//               ),
//               title: Text(
//                 'Map',
//                 style: TextStyle(
//                     fontSize: size.width * 0.05,
//                     fontFamily: "Montserrat",
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700),
//               ),
//               activeColor: Color(0xffFFE30A),
//               textAlign: TextAlign.center,
//             ),
//             BottomNavyBarItem(
//               icon: Icon(
//                 Icons.home_filled,
//                 color: Colors.black,
//                 size: size.width * 0.07,
//               ),
//               title: Text(
//                 'Home',
//                 style: TextStyle(
//                     fontSize: size.width * 0.05,
//                     fontFamily: "Montserrat",
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700),
//               ),
//               activeColor: Color(0xffFFE30A),
//               textAlign: TextAlign.center,
//             ),
//             BottomNavyBarItem(
//               icon: Icon(
//                 Icons.supervised_user_circle_rounded,
//                 color: Colors.black,
//                 size: size.width * 0.07,
//               ),
//               title: Text(
//                 'Profile',
//                 style: TextStyle(
//                     fontSize: size.width * 0.05,
//                     fontFamily: "Montserrat",
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700),
//               ),
//               activeColor: Color(0xffFFE30A),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
