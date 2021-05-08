import 'package:flutter/material.dart';
import 'Home.dart';
//import 'package:shared_preferences/';
// cant properly install shared pref due to issue in flutter on my PC....

void main() {
  runApp(ToDo());
  DateTime now = DateTime.now();
  now.toString();

}
class ToDo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "ToDo-List App",
     home: Home(),
   );
  }
}


