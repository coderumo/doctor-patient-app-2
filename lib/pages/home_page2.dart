import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'MERHABA,',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rumeysa Alkaya',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 76, 73, 84),
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 167, 147),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Color.fromARGB(255, 190, 238, 191),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bugün nasıl hissediyorsun?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Haydi! Doktorunla görüşmeye başla'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          color: Color.fromARGB(255, 234, 176, 195),
          child: Text('search bar burda olacak'),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 80,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 167, 147),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/teeth.png',
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Diş hekimi'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 167, 147),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/teeth.png',
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Diş hekimi'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 167, 147),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/teeth.png',
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Diş hekimi'),
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}
