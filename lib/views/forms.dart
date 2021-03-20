import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:get/get.dart';

class FormsPage extends StatefulWidget {
  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    FocusNode _namefn = FocusNode();
    FocusNode _detailsfn = FocusNode();
    FocusNode _commentFocusNode = FocusNode();

    String name = "";
    String details = "";
    String domain = "";
    File image;

    return Scaffold(
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: TextFormField(
                          focusNode: _detailsfn,
                          //   autofocus: true,
                          textCapitalization: TextCapitalization.words,
                          maxLines: 10,
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: TextFormField(
                          focusNode: _commentFocusNode,
                          // autofocus: true,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Comment",
                            hintText: "Comment about pothole",
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
                          validator: (comment) {
                            if (comment.isEmpty) {
                              return 'Comment is Required';
                            }
                            return null;
                          },
                          onChanged: (value) => {}),
                    ),
                    SizedBox(height: 20),
                    RaisedButton.icon(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      icon: Icon(Icons.image),
                      label: Text('Upload Image'),
                    ),
                    SizedBox(height: 20.0),
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
                    // DropDown(items: [
                    //   'Village Council (Gram Panchayat)',
                    //   'City Council (Nagarparishad)',
                    //   'Municipality (Nagarpalika)',
                    //   'Metropolitan(Mahaanagar-Paalika)',
                    //   'Private authority',
                    //   'Public Works Department (PWD)',
                    //   'District council (Zila Panchayat)',
                    //   'State Government',
                    //   'Central Government ',
                    //   'Others',
                    // ], hint: Text('Departments'), onChanged: (value) => {}),
                    // SizedBox(
                    //   height: 20.0,
                    // ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        print(name);
                        print(domain);
                        print(details);
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
