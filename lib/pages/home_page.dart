import 'package:doktorum/model/dr_model.dart';
import 'package:doktorum/pages/pt_login.dart';
import 'package:doktorum/services/api.dart';
import 'package:doktorum/services/dr_card.dart';
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
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   title: const Text('DOKTORUM'),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.notifications),
      //     )
      //   ],
      //   backgroundColor: Color.fromARGB(255, 52, 103, 54),
      //   shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(25),
      //     bottomRight: Radius.circular(25),
      //   )),
      // ),
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
