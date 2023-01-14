import 'package:doktorum/model/dr_model.dart';
import 'package:doktorum/pages/drawer_page.dart';
import 'package:doktorum/pages/first_page.dart';
import 'package:doktorum/pages/pt_login.dart';
import 'package:doktorum/services/api.dart';
import 'package:doktorum/pages/dr_card.dart';
import 'package:flutter/material.dart';

import '../messages/message.dart';
import 'home_page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isAlwaysShown = true;
  bool _showTrackOnHover = false;

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage2(),
    Message(),
    DRapi(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 52, 103, 54),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => FirstPage())));
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      drawer: MyDrawerPage(),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          iconSize: 30,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Ana Sayfa',
              backgroundColor: Color.fromARGB(255, 52, 103, 54),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Mesaj',
              backgroundColor: Color.fromARGB(255, 52, 103, 54),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Doktorlar',
              backgroundColor: Color.fromARGB(255, 52, 103, 54),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
