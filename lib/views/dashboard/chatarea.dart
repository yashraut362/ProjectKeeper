import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Chatarea extends StatefulWidget {
  @override
  _ChatareaState createState() => _ChatareaState();
}

class _ChatareaState extends State<Chatarea> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Annonymus Chatroom"),
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
              // <2> Pass `Stream<QuerySnapshot>` to stream
              stream: Firestore.instance
                  .collection('chat')
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // <3> Retrieve `List<DocumentSnapshot>` from snapshot
                  final List<DocumentSnapshot> documents =
                      snapshot.data.documents;
                  return ListView(
                      children: documents
                          .map(
                            (doc) => Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35))),
                                width: Get.width * 0.9,
                                height: Get.height * 0.05,
                                child: Center(
                                  child: Text(
                                    doc['message'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.020),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList());
                } else {
                  return Text("Its Error!");
                }
              }),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      final _firestore = Firestore.instance;
                      _firestore.collection('chat').add({
                        'message': myController.text,
                        'timestamp':
                            DateTime.now().millisecondsSinceEpoch.toString(),
                      });
                      myController.clear();
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 25,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
