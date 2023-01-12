import 'package:doktorum/pages/dr_login.dart';
import 'package:doktorum/pages/pt_login.dart';
import 'package:flutter/material.dart';

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
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 300,
            title: const Text('DOKTORUM Uygulamasına Hoş Geldiniz'),
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
          body: const TabBarView(
            children: [
              DRlogin(),
              PTlogin(),
            ],
          )),
    );
  }
}
