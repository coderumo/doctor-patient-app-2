import 'package:doktorum/pages/dr_login.dart';
import 'package:doktorum/pages/pt_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.akayaKanadakaTextTheme()),
        home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 230,
              title: Image.asset(
                'assets/icons/dr_patient.png',
                width: 200,
                height: 200,
              ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromARGB(255, 16, 89, 111),
                        Color.fromARGB(255, 46, 187, 209)
                      ]),
                ),
              ),
              //backgroundColor: Color.fromARGB(255, 47, 123, 118),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              )),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: 'DOKTOR ',
                  ),
                  Tab(
                    text: 'HASTA',
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                DRlogin(),
                PTlogin(),
              ],
            )),
      ),
    );
  }
}
