import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectskeeper/views/forms.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(FormsPage());
                },
                child: Icon(Icons.more_vert),
              )),
        ],
      ),
      body: Container(
        child: Center(
          child: Text('Homepage'),
        ),
      ),
    );
  }
}
