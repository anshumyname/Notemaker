import 'package:notemaker/taskdetails/taskdetails.dart';

class Tlist {
  String info="Not assigned";
  List<Taske> tasks = [
    Taske("Task1", "Many work to be done "),
    Taske("Task2",
        "Yes your work has to be done \n Lets do some more work \n What you can do ?"),
    Taske("Task3", "Oh Yes I did it "),
    Taske("Task4", "Yet another work to be done"),
  ];

  Future<void> addit(Taske t) async{
    tasks.add(t);
  }

  Future<void> delete(int idx) async{
      tasks.removeAt(idx);
  }
}

Tlist tasks1= Tlist();
Tlist tasks2= Tlist();
Tlist tasks3= Tlist();
List<Tlist> tasklist= [tasks1, tasks2 ,tasks3];

class Catlist {
  List<String> cats=[
    'Category1',
    'Category2',
    'Category3',
  ];

}

Catlist ct= Catlist();