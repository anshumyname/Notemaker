import 'package:flutter/material.dart';
import 'package:tasklist/database/listoftasks.dart';
import 'package:tasklist/screens/taskcard.dart';
import 'package:tasklist/taskdetails/taskdetails.dart';

class Task extends StatefulWidget {
  int tid;
  Task({this.tid});
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {

  @override
  Widget build(BuildContext context) {
    final heading = TextEditingController();
    final textall=  TextEditingController();


    return Scaffold(
      appBar: AppBar(
          title: Text('Todo List',textAlign: TextAlign.center,),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: tasklist[widget.tid].tasks.length,
        itemBuilder :((context, int index){

            Taske t= tasklist[widget.tid].tasks.elementAt(index);

            TaskCard tx= TaskCard(
               oncall: ()=> setState((){}),
                head: t.head,
                details: t.details,
                id: index,
                tid: widget.tid,
                context: context
            );
            return tx;
          })
      ),
       backgroundColor: Colors.grey,
       floatingActionButton: FloatingActionButton(
         tooltip: 'Add a New Task',
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
                     padding: const EdgeInsets.all(8.0),
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
                                 color: Colors.white
                               ),
                               decoration: InputDecoration(
                                   fillColor: Colors.red,
                                   border: InputBorder.none,
                                   hintText: 'Task Name '),
                             ),
                            ]),
                         SizedBox(height: 5,width: 5,),
                         TextField(
                           cursorColor: Colors.yellow,
                           style: TextStyle(
                               color: Colors.white
                           ),
                           maxLines: null,
                           controller: textall,
                           decoration: InputDecoration(
                               border: InputBorder.none,
                               hintText: 'Add Something About Your Task'),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                               children: <Widget>[
                                 MaterialButton(
                                   onPressed: () {
                                     Taske t= Taske(heading.text,textall.text);
                                     tasklist[widget.tid].tasks.add(t);
                                     Navigator.pop(context);
                                     setState(() {});

                                   },
                                   color: Colors.blue,
                                   textColor: Colors.white,
                                   child: Icon(
                                     Icons.add,
                                     size: 12,
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
         backgroundColor: Colors.black,
        child: Icon(Icons.add),
       ),
    );
  }
}

