import 'package:doktorum/pages/dr_login.dart';
import 'package:doktorum/pages/pt_login.dart';
import 'package:doktorum/pages/pt_register.dart';
import 'package:flutter/material.dart';

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
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 200,
            title: const Text('Kayıt olma ekranı'),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 52, 103, 54),
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
    );
  }
}
