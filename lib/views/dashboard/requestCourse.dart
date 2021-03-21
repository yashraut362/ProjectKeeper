import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:projectskeeper/views/utility/bottomnavbar.dart';
import 'package:projectskeeper/views/utility/homepage.dart';

class RequestCourse extends StatefulWidget {
  @override
  _RequestCourseState createState() => _RequestCourseState();
}

class _RequestCourseState extends State<RequestCourse> {
  String name = "";
  String domain = "Other";
  final _formKey = GlobalKey<FormState>();
  FocusNode _namefn = FocusNode();

  final _firestore = Firestore.instance;

  void uploadform() {
    _firestore
        .collection('courses')
        .add({'coursename': name, 'domain': domain}).then(
            (value) => Get.to(BottomNavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Request for courses"),
      ),
      body: ListView(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset('assets/splashscreen/form.png'),
                  DropDown(
                      items: [
                        "Mobile Application Development",
                        "Web Development",
                        "Artificial Intelligence",
                        "Machine Learning",
                        "Internet Of Things",
                        "Blockchain",
                        "OS development",
                        "Cloud Systems",
                        "Other"
                      ],
                      hint: Text('Course Domain'),
                      onChanged: (value) => {domain = value}),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: TextFormField(
                        focusNode: _namefn,
                        //  autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Course Name",
                          hintText: "Enter Name of Course",
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(8.0),
                            ),
                            borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (name) {
                          if (name.isEmpty) {
                            return 'Name is Required';
                          }
                          return null;
                        },
                        onChanged: (value) => {name = value}),
                  ),
                  RaisedButton.icon(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      uploadform();
                    },
                    icon: Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
