import 'package:flutter/material.dart';
import 'package:tasklist/screens/taskcard.dart';
import 'package:tasklist/taskdetails/taskdetails.dart';
class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<Taske> tasks=[
    Taske("Task1","Many work to be done "),
    Taske("Task2","Yes your work has to be done \n Lets do some more work \n What you can do ?"),
    Taske("Task3","Oh Yes I did it "),
    Taske("Task4","Yet another work to be done"),
  ];
  @override
  Widget build(BuildContext context) {
    final heading = TextEditingController();
    final textall=  TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: Text('TODO LIST'),
        backgroundColor: Colors.red,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: tasks.map((t) => TaskCard(head: t.head,details: t.details)).toList(),
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
                                       tasks.add(t);
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

