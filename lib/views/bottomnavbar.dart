import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectskeeper/views/homepage.dart';
import 'package:projectskeeper/views/learn.dart';
import 'package:projectskeeper/views/maps.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 1;

  final List children = [
    Maps(),
    Homepage(),
    Learn(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Icons.map,
              color: Colors.black,
              size: size.width * 0.07,
            ),
            title: Text(
              'Map',
              style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            activeColor: Color(0xffFFE30A),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.black,
              size: size.width * 0.07,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            activeColor: Color(0xffFFE30A),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.supervised_user_circle_rounded,
              color: Colors.black,
              size: size.width * 0.07,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            activeColor: Color(0xffFFE30A),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
