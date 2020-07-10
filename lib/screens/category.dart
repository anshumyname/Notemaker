import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notemaker/database/listoftasks.dart';
import 'package:notemaker/screens/task.dart';

class Category extends StatefulWidget {

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final heading = TextEditingController();



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'TASKS',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.grey[400],
      body:  ListView.builder(
            itemCount: ct.cats.length,
            itemBuilder: (context,int index){
//               dynamic tk = <Widget>[];
//              for(var i=0;i<ct.cats.length;i++){
//                tk.add(new Task(tid: i));
//              }
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.black45,
                    icon: Icons.delete,
                    onTap: () => {
//                  ct.cats.removeAt(index),
//                  tasklist.removeAt(index),
//                  setState((){}),
                    },
                  ),
                ],
                child: InkWell(
                  onTap: (){
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context)=> tk[index]),
//                );
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0,5,0,5),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: index%2==0?Colors.lightBlueAccent:Colors.blueGrey
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: IconButton(
                              onPressed: (){
//                            showDialog(
//                                context: context,
//                              builder: (BuildContext context){
//                                return Dialog(
//                                  backgroundColor: Colors.white12,
//                                  child: Padding(
//                                    padding: const EdgeInsets.all(20.0),
//                                    child: ListView(
//                                      shrinkWrap: true,
//                                      children: <Widget>[
//                                        Column(
//                                          mainAxisAlignment: MainAxisAlignment.center,
//                                          children: <Widget>[
//                                            Text('Details', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.cyanAccent),),
//                                            SizedBox(height: 5,width:5),
//                                            Text('Category Name : ${ct.cats[index]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
//                                            SizedBox(height: 5,width:5),
//                                            Text('Total Items : ${tasklist[index].tasks.length}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
//                                            SizedBox(height: 5,width:5),
//                                            Text('Created on : ${tasklist[index].info}',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white) ),
//                                          ],
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                );
//                              }
//                            );
                              },
                              icon: Icon(Icons.more_vert),
                              iconSize: 30,
                            ),
                          ),
                          SizedBox(height: 100, width: 50),
                          Center(
                            child: Text(
                                ct.cats[index],
                                style: TextStyle(fontSize: 30,color: Colors.white ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a New Task',
        onPressed: (){

//          showDialog(
//              context: context,
//              builder: (BuildContext context) {
//                return Dialog(
//                  backgroundColor: Colors.blueGrey,
//                  shape: RoundedRectangleBorder(
//                      borderRadius:
//                      BorderRadius.circular(20.0)), //this right here
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: ListView(
//                      shrinkWrap: true,
//                      children: [
////                       padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
//                        Column(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: [
//                              TextField(
//                                cursorColor: Colors.yellow,
//                                controller: heading,
//                                style: TextStyle(
//                                  fontSize: 25,
//                                    color: Colors.white
//                                ),
//                                decoration: InputDecoration(
//                                    fillColor: Colors.red,
//                                    border: InputBorder.none,
//                                    hintText: 'Task Name '),
//                              ),
//                            ]),
//                        SizedBox(height: 5,width: 5,),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.end,
//                          children: <Widget>[
//                            MaterialButton(
//                              onPressed: () {
//                                DateTime d= (new DateTime.now());
//                                String dtime= d.toString();
//                                Tlist tk= new Tlist();
//                                tk.info=dtime.substring(0,10);
//                                ct.cats.add(heading.text);
//                                tasklist.add(tk);
//                                Navigator.pop(context);
//                                setState(() {});
//
//                              },
//
//                              color: Colors.blue,
//                              textColor: Colors.white,
//                              child: Icon(
//                                Icons.add,
//                                size: 25,
//                              ),
//                              padding: EdgeInsets.all(6),
//                              shape: CircleBorder(),
//                              minWidth: 20,
//
//                            ),
//                          ],
//                        )
//                      ],
//                    ),
//                  ),
//
//                );
//              });
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}
