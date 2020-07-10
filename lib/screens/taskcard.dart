import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:notemaker/database/listoftasks.dart';
import 'package:notemaker/taskdetails/taskdetails.dart';

// ignore: must_be_immutable
class TaskCard extends StatefulWidget {
  final int id;
  final int len;
  final String head;
  final String details;
  final String did;
  final String tid;
  BuildContext context;
  final VoidCallback oncall;

  TaskCard({this.head,this.details,this.id,this.context,this.oncall,this.len,this.did,this.tid});

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final heading = TextEditingController();
  final textall=  TextEditingController();


  @override
  Widget build(BuildContext context) {
    var len= widget.len;

    if(widget.id==len){
      return  Padding(
        padding: const EdgeInsets.all(20.0),
        child: DottedBorder(
          dashPattern: [6, 3, 2, 3],
          color: Colors.black,
          strokeWidth: 3,
          child: Card(
            color: Colors.grey,
            child: Center(
              child: FloatingActionButton(
                backgroundColor: Colors.blueGrey[200],
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
//                       padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextField(
                                        cursorColor: Colors.yellow,
                                        controller: heading,
                                        style: TextStyle(
                                          fontSize: 25,
                                            color: Colors.white
                                        ),
                                        decoration: InputDecoration(
                                            fillColor: Colors.red,
                                            border: InputBorder.none,
                                            hintText: 'Task Name '),
                                      ),
                                    ]),
                                SizedBox(height: 20,width: 10,),
                                TextField(
                                  cursorColor: Colors.yellow,
                                  style: TextStyle(
                                    fontSize: 25,
                                      color: Colors.white
                                  ),
                                  maxLines: null,
                                  controller: textall,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Add Something About Your Task'),
                                ),
                                SizedBox(height: 20,width: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    MaterialButton(
                                      onPressed: () {
                                          Firestore.instance.collection('Categories').document(widget.did).collection('Tasks').document().setData({
                                            'Heading': heading.text,
                                            'Description' : textall.text,
                                          });
                                          widget.oncall();
                                          Navigator.pop(context);
                                      },
                                      color: Colors.blue,
                                      height: 50,
                                      textColor: Colors.white,
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                      ),
                                      padding: EdgeInsets.all(6),
                                      shape: CircleBorder(),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                        );
                      });

                },
                child: Icon(Icons.add, color: Colors.black,),
              ),
            ),
          ),
        ),
      );
    }


    return Dismissible(
      key: UniqueKey() ,
      direction: (widget.id%2==1)?DismissDirection.startToEnd:DismissDirection.endToStart,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: (){
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(20.0)), //this right here
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(20),
                    children : [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Text(
                            this.widget.head,
                            style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),
                          ),

                        ],
                        ),
                        Divider(
                          color: Colors.red,
                          thickness: 10,
                        ),
                        SizedBox(height: 5,width: 5),

                        Text(
                          this.widget.details,
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.lightBlueAccent,backgroundColor: Colors.black26),
                        ),
                    ],
                  ),
                );
              });

        },
        child: Card(
          color: Colors.blue[500],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Center(child: Text(widget.head,style: TextStyle(fontSize: 25),)),

        ),
      ),
      onDismissed: (direction)  {
        Firestore.instance.collection('Categories').document(widget.did).collection('Tasks').document(widget.tid).delete();
        widget.oncall();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Item dismissed")));
      },
    );
  }
}
