import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasklist/database/listoftasks.dart';

// ignore: must_be_immutable
class TaskCard extends StatefulWidget {
  final int id;
  final int tid;
  final String head;
  final String details;
  BuildContext context;
  final VoidCallback oncall;
  TaskCard({this.head,this.details,this.id,this.context,this.oncall,this.tid});

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  @override
  Widget build(BuildContext context) {

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
                            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
                          ),

                        ],
                        ),

                        SizedBox(height: 5,width: 5),
                        Text(
                          this.widget.details,
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightBlueAccent,backgroundColor: Colors.black26),
                        ),
                    ],
                  ),
                );
              });

        },
        child: Card(
          color: Colors.blue[500],
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Center(child: Text(widget.head,style: TextStyle(fontSize: 20),)),

        ),
      ),
      onDismissed: (direction) async {
        tasklist[widget.tid].delete(widget.id);
        widget.oncall();
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("item dismissed")));
      },
    );
  }
}
