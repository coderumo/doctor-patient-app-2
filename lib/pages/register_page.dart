import 'package:doktorum/pages/dr_login.dart';
import 'package:doktorum/pages/pt_login.dart';
import 'package:doktorum/pages/pt_register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dr_register.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.akayaKanadakaTextTheme()),
        home: Scaffold(
            appBar: AppBar(
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
              automaticallyImplyLeading: false,
              toolbarHeight: 200,
              title: const Text('Kayıt olma ekranı'),
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
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
            body: TabBarView(
              children: [
                DrRegister(),
                PtRegister(),
              ],
            )),
      ),
    );
  }
}
