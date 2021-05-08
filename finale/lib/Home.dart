import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'tasks.dart';

class Home extends StatefulWidget {
  @override
  _state createState() => _state();
}

class _state extends State<Home> {

  DateTime now = DateTime.now();
  int navbarindex = 0;
  addTasks(String input) {
    tasks.todo.add(input);
    print(tasks.todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = [
      Center(
        child: ListView.builder(
            itemCount: tasks.todo.length,
            itemBuilder: (context, i) => TasksCont(
                  Index: i,
                )),
      ),
      Center(
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            icon: Icon(
              Icons.input,
              color: Colors.white,
            ),
            hintText: 'Add your tasks',
          ),
          onSubmitted: (input) => addTasks(input),
        ),
      ),
    ];
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: bodyWidgets[navbarindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        iconSize: 30.0,
        onTap: (index) {
          setState(() {
            navbarindex = index;
          });
        },
        selectedItemColor: Colors.white,
        currentIndex: navbarindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add),
            label: 'Add Tasks',
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "ToDo-List App",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    ));
  }
}


class TasksCont extends StatelessWidget {
  final int Index;
  TasksCont({this.Index});
  bool value = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(

        children: [DynamicBox(),
          Text(
            tasks.todo[Index],
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),

        ],
      ),
    );
  }

}
/*
class TasksCont extends StatelessWidget{
  bool click = false;
  final int Index;
  TaskCont({this.Index})
  @override
 Widget build(BuildContext context) {
  return Container(
    height: 50.0,
    width: double.infinity,
    margin: EdgeInsets.all(8.0),
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Row(children: [
      GestureDetector(
        onTap:(){
         CheckboxListTile(value: click,onChanged: (value) {

         },);
        },
      )
    ],),
  );

  }

}*/

class DynamicBox extends StatefulWidget{
  @override
  _check createState()=>_check();
}
 class _check extends State<DynamicBox>{
  bool value=false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: value, onChanged: (value) {
      setState(() {
        this.value=value;

      });
      
    },
    );
    
  }


}