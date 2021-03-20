import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Allprojects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // <1> Use StreamBuilder
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Projects'),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            color: Theme.of(context).primaryColor,
            height: Get.height * 0.20,
            width: Get.width * 1,
            child: Center(
              child: Text('Hello'),
            ),
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
                // <2> Pass `Stream<QuerySnapshot>` to stream
                stream:
                    Firestore.instance.collection('allprojects').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // <3> Retrieve `List<DocumentSnapshot>` from snapshot
                    final List<DocumentSnapshot> documents =
                        snapshot.data.documents;
                    return ListView(
                        children: documents
                            .map(
                              (doc) => Card(
                                child: ListTile(
                                  leading: FlutterLogo(size: 72.0),
                                  title: Text('Name ' + doc['name']),
                                  subtitle: Text('Domain' + doc['name']),
                                  trailing: Icon(Icons.verified),
                                  isThreeLine: true,
                                ),
                              ),
                            )
                            .toList());
                  } else {
                    return Text("Its Error!");
                  }
                }),
          ),
        ],
      ),
    );
  }
}

// title: Text(doc['name']),
