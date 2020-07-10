import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notemaker/database/services.dart';
import 'package:notemaker/firebase_test.dart';

class Firebase extends StatefulWidget {
  @override
  _FirebaseState createState() => _FirebaseState();
}

class _FirebaseState extends State<Firebase> {
  //List<String> fru= ['Apple','Orange','mango'];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('Mai').snapshots(),
      builder: (context, snapshot){
         if(!snapshot.hasData) return Text('Nothing');
         print('has data');
         return ListView.builder(
           itemCount: snapshot.data.documents.length,
           itemBuilder: (context, index){
             DocumentSnapshot ds= snapshot.data.documents[index];
              var want= Firestore.instance.collection('Mai').document(ds.documentID).collection('Task').snapshots();
              print(want);
             return Column(
               children: <Widget>[
                 Text(
                   'efs'//want['head'],
                 ),
                 //Text(want['description']),
//                 Text(ds['']['description']),
               ],
             );
           },
         );
      },
    );
  }
}
