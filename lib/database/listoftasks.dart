import 'package:tasklist/taskdetails/taskdetails.dart';

class Tlist {
  List<Taske> tasks = [
    Taske("Task1", "Many work to be done "),
    Taske("Task2",
        "Yes your work has to be done \n Lets do some more work \n What you can do ?"),
    Taske("Task3", "Oh Yes I did it "),
    Taske("Task4", "Yet another work to be done"),
  ];

  Future<void> delete(int idx) async{
      tasks.removeAt(idx);
  }
}

Tlist tasks= Tlist();

  List<int> numbers=[2,1,4,3,7,8,1,8,2,22];