import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Allprojects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // <1> Use StreamBuilder
    return StreamBuilder<QuerySnapshot>(
        // <2> Pass `Stream<QuerySnapshot>` to stream
        stream: Firestore.instance.collection('allprojects').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            final List<DocumentSnapshot> documents = snapshot.data.documents;
            return ListView(
                children: documents
                    .map((doc) => Card(
                          child: ListTile(
                            title: Text(doc['name']),
                          ),
                        ))
                    .toList());
          } else {
            return Text("Its Error!");
          }
        });
  }
}