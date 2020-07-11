import 'package:shared_preferences/shared_preferences.dart';

setvisitinglap() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('already', true);
}

Future<bool> getvisitinglap() async{
  SharedPreferences preferences= await SharedPreferences.getInstance();
  bool visited = preferences.getBool('already')?? false;
  return visited;
}