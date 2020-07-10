import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notemaker/database/listoftasks.dart';
import 'package:notemaker/screens/taskcard.dart';

import 'package:notemaker/taskdetails/taskdetails.dart';

class Task extends StatefulWidget {
  final int tid;
  Task({this.tid});
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          title: Text('Todo List',textAlign: TextAlign.center,),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: tasklist[widget.tid].tasks.length+1,
        itemBuilder :((context, int index){
          var len=tasklist[widget.tid].tasks.length;
            bool flag=false;
            if(index==len) {
              flag = true;
            }
            Taske t;
            if(flag==false)
                t= tasklist[widget.tid].tasks.elementAt(index);

            TaskCard tx= TaskCard(
               oncall: ()=> setState((){}),
                head: (flag)?"":t.head,
                details: (flag)?"":t.details,
                id: index,
                tid: widget.tid,
                context: context
            );
            return tx;
          })
      ),
       backgroundColor: Colors.grey,
    );
  }
}

