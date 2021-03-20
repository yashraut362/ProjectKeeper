import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:projectskeeper/views/utility/homepage.dart';

class Mentors extends StatefulWidget {
  @override
  _MentorsState createState() => _MentorsState();
}

class _MentorsState extends State<Mentors> {
  String name = "";
  String details = "";
  String domain = "";
  String contact = "";
  final _formKey = GlobalKey<FormState>();
  FocusNode _namefn = FocusNode();
  FocusNode _detailsfn = FocusNode();
  FocusNode _contact = FocusNode();
  Position _currentPosion;

  final _firestore = Firestore.instance;

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosion = position;
      });
    }).then((_) => uploadform());
  }

  void uploadform() {
    _firestore.collection('mentorlist').add({
      'name': name,
      'details': details,
      'domain': domain,
      'contact': contact,
      'lat': _currentPosion.latitude,
      'long': _currentPosion.longitude
    }).then((value) => Get.to(Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      hint: Text('Expertized Domain'),
                      onChanged: (value) => {domain = value}),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: TextFormField(
                        focusNode: _namefn,
                        //  autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter Your Full Name",
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: TextFormField(
                        focusNode: _detailsfn,
                        //   autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          labelText: "Details About You",
                          hintText: "Share your experiences of this domain",
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
                        validator: (details) {
                          if (details.isEmpty) {
                            return 'Details is Required';
                          }
                          return null;
                        },
                        onChanged: (value) => {details = value}),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: TextFormField(
                        focusNode: _contact,
                        // autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Contact Detail",
                          hintText: "Preferably whatsapp number",
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
                        validator: (contact) {
                          if (contact.isEmpty) {
                            return 'Comment is Required';
                          }
                          return null;
                        },
                        onChanged: (value) => {contact = value}),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'By Submitting this form you are your location will be shared with nearby users'),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton.icon(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _getCurrentLocation();
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
