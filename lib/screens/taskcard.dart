import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  String head;
  String details;
  TaskCard({this.head,this.details});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: (){
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.lightGreen[100],
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(20.0)), //this right here
                child: ListView(
                  shrinkWrap: true,
                  children : [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text(
                          this.head,
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),
                        ),

                      ],
                      ),

                      SizedBox(height: 5,width: 5),
                      Text(
                        this.details,
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red,backgroundColor: Colors.lightGreen[100]),
                      ),
                  ],
                ),
              );
            });

      },
      child: Card(
        color: Colors.green[100],
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Text(head,style: TextStyle(fontSize: 20),),

      ),
    );
  }
}
