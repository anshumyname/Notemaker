import 'package:flutter/material.dart';
import 'package:tasklist/database/listoftasks.dart';
import 'package:tasklist/screens/taskcard.dart';
import 'package:tasklist/taskdetails/taskdetails.dart';

class Task extends StatefulWidget {
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
          title: Text('TODO LIST'),
        backgroundColor: Colors.red,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: tasks.tasks.length,
        itemBuilder :((context, int index){

            Taske t= tasks.tasks.elementAt(index);

            TaskCard tx= TaskCard(
               oncall: ()=> setState((){}),
                head: t.head,
                details: t.details,
                id: index,
                context: context
            );
            return tx;
          })
      ),
       floatingActionButton: FloatingActionButton(
         tooltip: 'Add a New Task',
         onPressed: (){

           showDialog(
               context: context,
               builder: (BuildContext context) {
                 return Dialog(
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
                               controller: heading,
                               decoration: InputDecoration(
                                   border: InputBorder.none,
                                   hintText: 'Name '),
                             ),
                            ]),
                         SizedBox(height: 5,width: 5,),
                         TextField(

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
                                       tasks.tasks.add(t);
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
         backgroundColor: Colors.red,
        child: Icon(Icons.add),
       ),
    );
  }
}

