import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterprojects/new_event.dart';

// void main() => runApp(MaterialApp(
//       home: Home()
//         ),
// );
// class Home extends StatelessWidget{
//   final List<String> items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//     'Item 6',
//     'Item 7',
//     'Item 8',
//   ];
//
//   void _addItem() {
//     var setState;
//     setState(() {
//       items.add('New Item'); // Add a new item to the list
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Event Scheduler App'),
//         centerTitle: true,
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.blue,
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//             return ListTile(
//             title: Text(items[index]),
//               titleAlignment: ListTileTitleAlignment.center,
//               subtitle: Text('write here'),
//               tileColor: Colors.blueAccent,
//               leading: Icon(Icons.done_outline),
//               trailing: Icon(Icons.close),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 side: BorderSide(
//                   color: Colors.white,
//                   width: 5,
//                 )
//               ),
//           );
//         },
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         child: Text('+ Add'),
//         onPressed: _addItem,
//         tooltip: 'Add Item',
//         backgroundColor: Colors.redAccent,
//         foregroundColor: Colors.white,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Color.fromRGBO(0, 0, 250, 80),
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Color.fromRGBO(190, 170, 200, 100),
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.event_outlined),
//               label: 'Events',
//             ),
//           ]
//       ),
//     );
//
//   }
// }
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeSelectedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _list=[
    Padding(padding: const EdgeInsets.only(left:15,right:15)),
    Text("Events :",
    style: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      color: Colors.white,
    ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(

        appBar: AppBar(
          leading: Icon(Icons.event_outlined),
            title: Text("Event Scheduler",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(50, 50, 200, 0.5),
            body: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.event_note, color: Colors.white,),
                title: _list[index], // The text for the current item
              );
            },

            ),
        floatingActionButton: Builder(
            builder: (context){
              return FloatingActionButton(
                 onPressed: () async {
                   _onItemTapped;
                   String newText = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewEventScreen()));
                   setState(() {
                     _list.add(Text(newText,style: TextStyle(color: Colors.white),));
                   });
  },
              child: Icon(Icons.add),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
  );
  }
  ),
  bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(0, 0, 250, 80),
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromRGBO(190, 170, 200, 100),
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_outlined),
              label: 'New Event',
            ),
          ]
      ),
      ),
    );
  }
}
