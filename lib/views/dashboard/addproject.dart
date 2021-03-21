import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectskeeper/views/utility/bottomnavbar.dart';

class Addproject extends StatefulWidget {
  @override
  _AddprojectState createState() => _AddprojectState();
}

class _AddprojectState extends State<Addproject> {
  @override
  Widget build(BuildContext context) {
    String name = "";
    String details = "";
    String domain = "";
    String picture = "";
    String filename = "";
    String contact = "";
    File image;
    final picker = ImagePicker();
    final _formKey = GlobalKey<FormState>();
    FocusNode _namefn = FocusNode();
    FocusNode _detailsfn = FocusNode();
    FocusNode _commentFocusNode = FocusNode();
    FocusNode _contact = FocusNode();

    final _firestore = Firestore.instance;

    void uploadform() async {
      _firestore.collection('allprojects').add({
        'name': name,
        'details': details,
        'domain': domain,
        'contact': contact,
        'imageurl': picture,
      }).then((value) => Get.to(BottomNavBar()));
    }

    Future<String> uploadImage() async {
      StorageReference ref = FirebaseStorage.instance.ref().child(filename);
      StorageUploadTask uploadTask = ref.putFile(image);

      var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      var url = downUrl.toString();
      picture = url;
      print(picture);
      uploadform();
    }

    Future _getImage() async {
      var selectedImage =
          await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        image = selectedImage;
        filename = basename(image.path);
      });
      uploadImage();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Submit Project"),
      ),
      body: SafeArea(
        child: ListView(
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
                        hint: Text('Domain of Project'),
                        onChanged: (value) => {domain = value}),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: TextFormField(
                          focusNode: _namefn,
                          //  autofocus: true,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Project Name",
                            hintText: "Complete Name of project",
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
                            labelText: "Details of Project",
                            hintText: "Complete details of project",
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
                          focusNode: _commentFocusNode,
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
                    RaisedButton.icon(
                      color: Theme.of(context).primaryColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        _getImage();
                      },
                      icon: Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Upload Image and Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
