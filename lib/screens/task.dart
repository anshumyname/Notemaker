import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notemaker/screens/taskcard.dart';
import 'package:notemaker/taskdetails/taskdetails.dart';

import 'category.dart';

class Task extends StatefulWidget {
  final DocumentSnapshot ds;
  final int tid;
  var total;
  Task({this.ds,this.tid});
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection(mainid).document(widget.ds.documentID).collection('Tasks').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return Scaffold(
          appBar: AppBar(
            title: Text(widget.ds['Name'],textAlign: TextAlign.center,),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.grey,
        );
        widget.total= snapshot.data.documents.length;
        return Scaffold(
          appBar: AppBar(
              title: Text(widget.ds['Name'],textAlign: TextAlign.center,),
            backgroundColor: Colors.black,
          ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: snapshot.data.documents.length+1,
            itemBuilder :((context, int index){


              var len=snapshot.data.documents.length;
                bool flag=false;
                if(index==len) {
                  flag = true;
                }
                Taske t;

                if(flag==false) {
                  DocumentSnapshot dx= snapshot.data.documents[index];
                  var hx=dx['Heading'];
                  var des= dx['Description'];
                  var docid=dx.documentID;
                  t= Taske(hx,des,docid);
                }

                TaskCard tx= TaskCard(
                   oncall: ()=> setState((){}),
                    head: (flag)?"":t.head,
                    details: (flag)?"":t.details,
                    id: index,
                    len: len,
                    did: widget.ds.documentID,
                    tid: (flag)?"":t.docid,
                    context: context
                );

                return tx;
              })
          ),
           backgroundColor: Colors.grey,
        );
      }
    );
  }
}

