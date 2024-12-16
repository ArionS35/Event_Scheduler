import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NewEventScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _NewEventScreen();
}

class _NewEventScreen extends State<NewEventScreen>{
  int _selectedIndex = 1;

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
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("New Event",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
    ),
        backgroundColor: Color.fromRGBO(50, 50, 200, 0.5),
        body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 10)),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),    // Top-left corner radius
                topRight: Radius.circular(20),
            ),
              color: Colors.lightBlue[900],
              border: Border(
                     top: BorderSide(color: Colors.white,width: 2),
                     left: BorderSide(color: Colors.white,width: 2),
                     right: BorderSide(color: Colors.white,width: 2),
              ),
              ),
            child: Row(
            children: [
            Icon(Icons.edit_outlined,color: Colors.white),
            Text("  Write your Event details below",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
            ),
            ),
      ]
            ),
          ),
          Container(
    height: 50,
    width: 380,
    decoration: BoxDecoration(
    //borderRadius: BorderRadius.circular(20),
    color: Colors.lightBlueAccent[700],
      border: Border(
        bottom: BorderSide(color: Colors.white,width: 2),
        left: BorderSide(color: Colors.white,width: 2),
        right: BorderSide(color: Colors.white,width: 2),
      ),
    ),
            child: Column(
              children: [
          TextField(
            controller: _textEditingController,
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
    ),
    ],
          ),
          ),
          Builder(
             builder: (context) {
    return ElevatedButton(onPressed: () {
    String newEventText = _textEditingController.text;
    Navigator.of(context).pop(newEventText);
    },
        child: Text("ADD",style: TextStyle(fontWeight: FontWeight.bold),),
    );


             }
    ),
          Image.asset('assets/eventbg.png'),
      ],

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
    );
  }
}