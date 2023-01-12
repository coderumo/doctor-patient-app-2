import 'dart:ffi';

import 'package:doktorum/pages/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dr_card_2.dart';

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
              SizedBox(
                width: 80,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.exit_to_app)),
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
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 52, 103, 54),
                      borderRadius: BorderRadius.circular(60)),
                  height: 120,
                  width: 140,
                  child: Image.asset(
                    'assets/icons/dr_patient.png',
                    fit: BoxFit.cover,
                  ),
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Category(
                  categoryName: 'Diş Hekimi',
                  iconImagePath: 'assets/icons/teeth.png'),
              Category(
                  categoryName: 'Kardiyolog',
                  iconImagePath: 'assets/icons/heart.png'),
              Category(
                  categoryName: 'Ortopedi',
                  iconImagePath: 'assets/icons/ortopedi.png'),
              Category(
                  categoryName: 'Nöroloji',
                  iconImagePath: 'assets/icons/nöroloji.png'),
              Category(
                  categoryName: 'KBB', iconImagePath: 'assets/icons/kbb.png'),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Doktor Listesi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Hepsini Gör',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Expanded(
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            DrCard2(
                doctorImagePath: 'assets/icons/man_pp.png',
                doctorName: 'Fırat Alkaya',
                doctorProfession: 'Kardiyolog',
                raiting: '4.9'),
            DrCard2(
                doctorImagePath: 'assets/icons/man_pp.png',
                doctorName: 'Mehmet Demir',
                doctorProfession: 'Nörolog',
                raiting: '4.6'),
            DrCard2(
                doctorImagePath: 'assets/icons/man_pp.png',
                doctorName: 'Yunus Taş',
                doctorProfession: 'Genel Cerrah',
                raiting: '4.0'),
            DrCard2(
                doctorImagePath: 'assets/icons/man_pp.png',
                doctorName: 'Semih ALKAYA',
                doctorProfession: 'KBB',
                raiting: '4.8'),
          ],
        ))
      ],
    );
  }
}
