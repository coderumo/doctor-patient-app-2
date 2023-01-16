import 'package:doktorum/pages/dr_profil.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../model/dr_model.dart';

class DRCard3 extends StatefulWidget {
  const DRCard3({
    Key? key,
    required this.user,
  }) : super(key: key);

  final DRModel user;

  @override
  State<DRCard3> createState() => _DRCard3State();
}

class _DRCard3State extends State<DRCard3> {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    // ignore: unused_local_variable
    int randomNumber = random.nextInt(5);
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 16, 89, 111),
              Color.fromARGB(255, 46, 187, 209)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 10, left: 60),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => DRProfile())));
                          },
                          icon: Image.asset(
                            'assets/icons/man_pp.png',
                            height: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Text(
                              randomNumber.toDouble().toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                buildText("Ad: ", widget.user.ad.toString()),
                buildText("Soyad: ", widget.user.soyad.toString()),
                buildText("Uzmanlık : ", widget.user.uzman.toString()),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.comment,
                        color: Color.fromARGB(255, 59, 76, 85),
                        size: 15,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'Yorum yaz',
                        style:
                            TextStyle(color: Color.fromARGB(255, 59, 76, 85)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildText(String str, dynamic str2) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Text(
            '$str',
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${str2.toString()}',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
