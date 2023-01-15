import 'package:doktorum/model/dr_model.dart';
import 'package:doktorum/pages/first_page.dart';
import 'package:doktorum/pages/pt_login.dart';
import 'package:doktorum/pages/user_profile.dart';
import 'package:doktorum/services/api.dart';
import 'package:doktorum/pages/dr_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    UserProfile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.akayaKanadakaTextTheme()),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 16, 89, 111),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            SizedBox(
              width: 280,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => FirstPage())));
                },
                icon: Icon(Icons.exit_to_app)),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 229, 228, 228),
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
                backgroundColor: Color.fromARGB(255, 16, 89, 111),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Mesaj',
                backgroundColor: Color.fromARGB(255, 16, 89, 111),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
                backgroundColor: Color.fromARGB(255, 16, 89, 111),
              ),
            ],
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
          ),
        ),
      ),
    );
  }
}
